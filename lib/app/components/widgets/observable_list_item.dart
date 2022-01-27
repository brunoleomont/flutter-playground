import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:playground/app/models/observable_list_item_model.dart';

class ObservableListItem extends StatelessWidget {
  const ObservableListItem(Key? key, this.item, this.removeItem) : super(key: key);

  final ObservableListItemModel item;

  final Function()? removeItem;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        title: Text(item.title),
        leading: Checkbox(value: item.check, onChanged: item.setCheck),
        trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: removeItem),
      );
    });
  }
}
