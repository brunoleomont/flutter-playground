// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_list_item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObservableListItemModel on _ObservableListItemModelBase, Store {
  final _$titleAtom = Atom(name: '_ObservableListItemModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$checkAtom = Atom(name: '_ObservableListItemModelBase.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  final _$_ObservableListItemModelBaseActionController =
      ActionController(name: '_ObservableListItemModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_ObservableListItemModelBaseActionController
        .startAction(name: '_ObservableListItemModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ObservableListItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheck(bool? value) {
    final _$actionInfo = _$_ObservableListItemModelBaseActionController
        .startAction(name: '_ObservableListItemModelBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_ObservableListItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
check: ${check}
    ''';
  }
}
