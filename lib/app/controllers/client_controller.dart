import 'package:mobx/mobx.dart';
import 'package:playground/app/models/client_mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientControllerBase with _$ClientController;

abstract class _ClientControllerBase with Store {
  var client = ClientMobx();

  String? validateName() {
    if (client.name == '' || client.name.isEmpty) {
      return 'Este campo é obrigatório';
    }
  }
  String? validateEmail() {
    if (client.email == '' || client.email.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (!client.email.contains('@')){
      return 'Email inválido';
    }
  }
  String? validateCpf() {
    if (client.cpf == '' || client.cpf.isEmpty) {
      return 'Este campo é obrigatório';
    }
  }
}
