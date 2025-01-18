import '../model/todo_model.dart';

abstract class TodoRepo {
  Future<void> addTodo(TodoModel todoModel) ;
  Future<void> deleteTodo(int id) ;
  Future<void> editTodo(int id, TodoModel todoModel) ;
  Future<List<TodoModel>> fetchTodos(int userId);
}