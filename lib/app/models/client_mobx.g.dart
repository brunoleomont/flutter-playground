// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientMobx on _ClientMobxBase, Store {
  final _$nameAtom = Atom(name: '_ClientMobxBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cpfAtom = Atom(name: '_ClientMobxBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$emailAtom = Atom(name: '_ClientMobxBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$_ClientMobxBaseActionController =
      ActionController(name: '_ClientMobxBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_ClientMobxBaseActionController.startAction(
        name: '_ClientMobxBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_ClientMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCpf(String value) {
    final _$actionInfo = _$_ClientMobxBaseActionController.startAction(
        name: '_ClientMobxBase.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_ClientMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_ClientMobxBaseActionController.startAction(
        name: '_ClientMobxBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_ClientMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
cpf: ${cpf},
email: ${email}
    ''';
  }
}
