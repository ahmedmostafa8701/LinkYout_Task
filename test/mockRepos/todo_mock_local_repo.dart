import 'package:link_you_task/features/todo/data/todo_local_repo.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';

class TodoMockLocalRepo extends TodoLocalRepo{
  List<TodoModel> todoModels = [];
  @override
  Future<void> deleteTodoById(int id) async{
    todoModels.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> deleteTodos() async{
    todoModels.clear();
  }

  @override
  Future<List<TodoModel>> fetchTodos() async{
    return todoModels;
  }

  @override
  Future<void> insertTodo(TodoModel todoModel) async{
    todoModels.add(todoModel);
  }

  @override
  Future<void> insertTodos(List<TodoModel> _todoModels) async{
    todoModels.addAll(_todoModels);
  }

  @override
  Future<void> updateTodoById(int id, TodoModel todoModel) async{
    todoModels[todoModels.indexWhere((e)=>e.id == id)] = todoModel;
  }

}