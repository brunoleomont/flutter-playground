import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:playground/app/models/observable_list_item_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase
    with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  final itensList = BehaviorSubject<List<ObservableListItemModel>>.seeded([]);
  final filter = BehaviorSubject<String>.seeded('');
  ObservableStream<List<ObservableListItemModel>>? output;

  _ObservableListControllerBase() {
    output = Rx.combineLatest2<List<ObservableListItemModel>, String,
            List<ObservableListItemModel>>(itensList.stream, filter.stream,
        (list, filter) {
      if (filter.isEmpty || filter == '') {
        return list;
      } else {
        return list
            .where((element) =>
                element.title.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
    }).asObservable(initialValue: []);
  }

  // @observable
  // ObservableList<ObservableListItemModel> itensList = [
  //   ObservableListItemModel('Item 1', false),
  //   ObservableListItemModel('Item 2', true),
  //   ObservableListItemModel('Item 3', false)
  // ].asObservable();

  // @observable
  // String filter = '' ;

  @action
  addItem(ObservableListItemModel value) {
    var list = List<ObservableListItemModel>.from(itensList.value);
    list.add(value);
    itensList.add(list);
  }

  @action
  removeItem(ObservableListItemModel value) {
    var list = List<ObservableListItemModel>.from(itensList.value);
    list.removeWhere((element) => element.title == value.title);
    itensList.add(list);
  }

  @computed
  int get totalChecked {
    // if (output != null) {
    //   return output!.data.where((element) => element.check).length;
    // } else {
    //   return 0;
    // }
    return 0;
  }

  // @action
  setFilter(String value) => filter.add(value);

  // @computed
  // List<ObservableListItemModel> get listFiltred {
  //   if (filter.isEmpty || filter == '') {
  //     return itensList;
  //   } else {
  //     return itensList
  //         .where((element) =>
  //             element.title.toLowerCase().contains(filter.toLowerCase()))
  //         .toList();
  //   }
  // }
}
