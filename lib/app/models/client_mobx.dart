import 'package:mobx/mobx.dart';

part 'client_mobx.g.dart';

class ClientMobx = _ClientMobxBase with _$ClientMobx;

abstract class _ClientMobxBase with Store {
  @observable
  String name = '';
  @action
  changeName(String value) => name = value;

  @observable
  String cpf = '';
  @action
  changeCpf(String value) => cpf = value;

  @observable
  String email = '';
  @action
  changeEmail(String value) => email = value;
}
