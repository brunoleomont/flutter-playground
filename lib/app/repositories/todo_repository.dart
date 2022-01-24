import 'package:dio/dio.dart';
import 'package:playground/app/models/todo_model.dart';

class TodoRepository {
  Dio dio;
  String finalUrl = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository(this.dio);

  Future<List<TodoModel>> fetch() async {
    final response = await dio.get(finalUrl);
    final list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
