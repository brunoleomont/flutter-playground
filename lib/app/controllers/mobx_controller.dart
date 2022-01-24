import 'package:mobx/mobx.dart';

// gerado com flutter pub run build_runner build
// ou usar flutter pub run build_runner watch
part 'mobx_controller.g.dart';

// Sem store
// class MobxController with Store {
//   var _counter = Observable(0);
//   int get counter => _counter.value;
//   set counter(int value) => _counter.value = value;

//   Action increment = Action((){});

//   MobxController() {
//     increment = Action(_increment);
//   }

//   _increment() {
//     counter++;
//   }
// }

// com mobx_codegen e build_runner
class MobxController = MobxControllerBase with _$MobxController;

abstract class MobxControllerBase with Store {
  @observable
  int counter = 0;

  @observable
  String name = '';

  @observable
  String lastName = '';

  // Computed Properties
  @computed
  String get fullName => "$name $lastName";

  @action
  increment() {
    counter++;
  }

  changeName(String newName) {
    name = newName;
  }

  changeLastName(String newLastName) {
    lastName = newLastName;
  }
}
