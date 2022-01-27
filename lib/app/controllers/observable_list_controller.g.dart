// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObservableListController on _ObservableListControllerBase, Store {
  Computed<int>? _$totalCheckedComputed;

  @override
  int get totalChecked =>
      (_$totalCheckedComputed ??= Computed<int>(() => super.totalChecked,
              name: '_ObservableListControllerBase.totalChecked'))
          .value;

  final _$_ObservableListControllerBaseActionController =
      ActionController(name: '_ObservableListControllerBase');

  @override
  dynamic addItem(ObservableListItemModel value) {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.addItem');
    try {
      return super.addItem(value);
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ObservableListItemModel value) {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.removeItem');
    try {
      return super.removeItem(value);
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalChecked: ${totalChecked}
    ''';
  }
}
