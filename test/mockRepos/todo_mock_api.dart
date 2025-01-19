import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/domain/repo/todo_repo.dart';

class TodoMockApi extends TodoRepo{
  List<TodoModel> todoModels = [];
  @override
  Future<void> addTodo(TodoModel todoModel) async {
    todoModels.add(todoModel);
  }

  @override
  Future<void> deleteTodo(int id) async {
    todoModels.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> editTodo(int id, TodoModel todoModel) async{
    todoModels[todoModels.indexWhere((e)=>e.id == id)] = todoModel;
  }

  @override
  Future<List<TodoModel>> fetchTodos(int userId) async{
    return todoModels;
  }

}