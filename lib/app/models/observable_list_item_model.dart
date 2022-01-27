import 'package:mobx/mobx.dart';
part 'observable_list_item_model.g.dart';

class ObservableListItemModel = _ObservableListItemModelBase with _$ObservableListItemModel;

abstract class _ObservableListItemModelBase with Store {
  _ObservableListItemModelBase(this.title, this.check);

  @observable
  String title = '';

  @action
  setTitle(String value) => title = value;
  
  @observable
  bool check = false;
  
  @action
  void setCheck(bool? value) => check = value ?? false;
}
