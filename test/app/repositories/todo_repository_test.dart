//@dart=2.9
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground/app/models/todo_model.dart';
import 'package:playground/app/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = TodoRepository(dio);

  test('deve trazer lista de TodoModel', () async {
    when(dio.get(any)).thenAnswer(
        (realInvocation) async => Response(data: jsonDecode(jsonData)));
    List<TodoModel> todos = await repository.fetch();
    expect(todos[0].title, 'delectus aut autem');
  });
}

String jsonData = '''
[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  }
]
''';
