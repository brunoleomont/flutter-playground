import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:playground/app/controllers/client_controller.dart';
import 'package:playground/app/controllers/mobx_controller.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({Key? key}) : super(key: key);

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  final controller = MobxController();
  final clientController = ClientController();

  // ignore: non_constant_identifier_names
  _TextField({String? labelText, onChanged, Function()? errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _TextField(
                  errorText: clientController.validateName,
                  labelText: 'name',
                  onChanged: clientController.client.changeName);
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _TextField(
                  errorText: clientController.validateEmail,
                  labelText: 'E-mail',
                  onChanged: clientController.client.changeEmail);
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _TextField(
                  errorText: clientController.validateCpf,
                  labelText: 'CPF',
                  onChanged: clientController.client.changeCpf);
            }),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              onChanged: controller.changeName,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Sobrenome'),
              onChanged: controller.changeLastName,
            ),
            SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return Text('${controller.fullName}');
            }),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Observer(builder: (_) {
                return Text(
                  'Counter = ${controller.counter}',
                  style: TextStyle(fontSize: 20.0),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
