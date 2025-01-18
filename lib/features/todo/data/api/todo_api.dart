import 'package:dio/dio.dart';
import 'package:link_you_task/constant.dart';
import 'package:link_you_task/features/todo/data/api/dio_auth.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/domain/repo/todo_repo.dart';

class TodoApi extends TodoRepo{
  Dio dio;
  int userId;
  TodoApi({required this.dio, this.userId = 1});
  @override
  Future<void> addTodo(TodoModel todoModel) async{
    await dio.post(BASE_URL+TODO_EndPoint+'add', data: todoModel.toJson());
  }

  @override
  Future<void> deleteTodo(int id) async{
    await dio.delete(BASE_URL+TODO_EndPoint + id.toString());
  }

  @override
  Future<void> editTodo(int id, TodoModel todoModel) async{
    await dio.put(BASE_URL+TODO_EndPoint+id.toString(), data: todoModel.toJson());
  }

  @override
  Future<List<TodoModel>> fetchTodos() async{
    var response = await dio.get('$BASE_URL${TODO_EndPoint}user/$userId');
    var todosJson = response.data['todos'] as List;
    return todosJson.map((todoJson) => TodoModel.fromJson(todoJson)).toList();
  }

}