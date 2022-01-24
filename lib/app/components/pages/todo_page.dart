import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:playground/app/controllers/todo_controller.dart';
import 'package:playground/app/repositories/todo_repository.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final controller = new TodoController(new TodoRepository(new Dio()));

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  _success() {
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (value) {},
            ),
            title: Text(todo.title!),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          child: Text('Tentar Novamente')),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Center();
  }

  stateManagment(TodoState state) {
    switch (state) {
      case TodoState.start:
        return _start();
      case TodoState.loading:
        return _loading();
      case TodoState.error:
        return _error();
      case TodoState.success:
        return _success();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.refresh_outlined),
                onPressed: () {
                  controller.start();
                })
          ],
          title: Text('To-Do List'),
        ),
        body: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagment(controller.state.value);
            }));
  }
}
