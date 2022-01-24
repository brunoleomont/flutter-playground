import 'package:flutter/material.dart';
import 'package:playground/app/components/pages/mobx_page.dart';
import 'package:playground/app/components/pages/todo_page.dart';
import 'package:playground/app/controllers/app_controller.dart';
import 'package:playground/app/controllers/client_controller.dart';
import 'package:playground/app/controllers/mobx_controller.dart';
import 'package:playground/app/models/counter.dart';
import 'package:playground/app/components/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              Provider<MobxController>(create: (_) => MobxController(), dispose: (_, controller) => controller.dispose,),
              Provider<ClientController>(create: (_) => ClientController())
            ],
            child: MaterialApp(
                title: 'Flutter Playground',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    brightness: AppController.instance.isDarkTheme
                        ? Brightness.dark
                        : Brightness.light),
                // home: MyHomePage('Flutter Playground'),
                // home: LoginPage()
                initialRoute: 'home',
                routes: {
                  '/': (context) => LoginPage(),
                  'home': (context) => MyHomePage('My homepage'),
                  'todo': (context) => TodoPage(),
                  'mobx-page': (context) => MobxPage()
                }),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = new Counter();

  @override
  initState() {
    super.initState();
    counter.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://avatars.githubusercontent.com/u/7306682?v=4'),
                ),
                accountName: Text('Bruno'),
                accountEmail: Text('bruno@email.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de Início'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              subtitle: Text('Finalizar Sessao'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [CustomSwitch()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'mobx-page');
              },
              child: Text('Mobx Page'))
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
