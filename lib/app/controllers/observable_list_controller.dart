import 'package:mobx/mobx.dart';
import 'package:playground/app/models/observable_list_item_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase
    with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  @observable
  ObservableList<ObservableListItemModel> itensList = [
    ObservableListItemModel('Item 1', false),
    ObservableListItemModel('Item 2', true),
    ObservableListItemModel('Item 3', false)
  ].asObservable();

  @observable
  String filter = '' ;

  @action
  addItem(ObservableListItemModel value) => itensList.add(value);

  @action
  removeItem(ObservableListItemModel value) => itensList.removeWhere((element) => element.title == value.title);

  @computed
  int get totalChecked => itensList.where((element) => element.check).length;

  @action
  setFilter(String value) => filter = value; 

  @computed
  List<ObservableListItemModel> get listFiltred {
    if (filter.isEmpty || filter == '') {
      return itensList;
    } else {
      return itensList.where((element) => element.title.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  } 
}
