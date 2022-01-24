import 'package:flutter/cupertino.dart';
import 'package:playground/app/models/todo_model.dart';
import 'package:playground/app/repositories/todo_repository.dart';

class TodoController {
  List<TodoModel> todos = [];
  final TodoRepository repository;
  final state = ValueNotifier<TodoState>(TodoState.start);

  TodoController(this.repository);

  Future start() async {
    state.value = TodoState.loading;
    try {
      todos = await repository.fetch();
      state.value = TodoState.success;
    } catch (e) {
      state.value = TodoState.error;
    }
  }
}

enum TodoState { start, loading, success, error }
