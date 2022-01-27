import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:playground/app/components/widgets/observable_list_item.dart';
import 'package:playground/app/controllers/observable_list_controller.dart';
import 'package:playground/app/models/observable_list_item_model.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({Key? key}) : super(key: key);

  @override
  _ObservableListPageState createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final controller = ObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: controller.setFilter,
            decoration: InputDecoration(hintText: 'Pesquisa...'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Observer(builder: (_) {
                return Text('${controller.totalChecked}');
              }),
              onPressed: () {},
            )
          ],
        ),
        body: Observer(builder: (_) {
          return ListView.builder(
              itemCount: controller.listFiltred.length,
              itemBuilder: (_, index) {
                var item = controller.listFiltred[index];
                return ObservableListItem(null, item, () {
                  controller.removeItem(item);
                });
              });
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Navigator.pushNamed(context, 'observable-list-dialog');
            _dialog();
          },
        ));
  }

  _dialog() {
    var model = ObservableListItemModel('', false);
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar Item'),
            content: TextField(
              onChanged: (_) {
                model.setTitle(_);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Novo Item'),
            ),
            actions: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.remove),
                  label: Text(
                    'Cancelar',
                  )),
              ElevatedButton.icon(
                  onPressed: () {
                    controller.addItem(model);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add),
                  label: Text('Salvar')),
            ],
          );
        });
  }
}
