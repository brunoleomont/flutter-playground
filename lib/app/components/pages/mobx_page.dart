import 'package:flutter/material.dart';
import 'package:playground/app/components/widgets/mobx_body.dart';
import 'package:playground/app/controllers/mobx_controller.dart';
import 'package:provider/provider.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({Key? key}) : super(key: key);

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  @override
  Widget build(BuildContext context) {
  final controller = Provider.of<MobxController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx'),
      ),
      body: MobxBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
