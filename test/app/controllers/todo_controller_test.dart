//@dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground/app/controllers/todo_controller.dart';
import 'package:playground/app/models/todo_model.dart';
import 'package:playground/app/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository{}

main(){
  final repository = TodoRepositoryMock();
  final controller = new TodoController(repository);

  test('deve preencher variavel todo', () async {
    when(repository.fetch()).thenAnswer((realInvocation) async => [TodoModel()]);
    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.success);
    expect(controller.todos.isNotEmpty , true);
  });
  test('deve mudar o state para error se a requisiçao falhar', () async {
    when(repository.fetch()).thenThrow(Exception());
    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.error);
  });
}