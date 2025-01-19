import 'package:link_you_task/features/todo/domain/model/todo_model.dart';

abstract class TodoLocalRepo {
  Future<void> insertTodos(List<TodoModel> todoModels);

  Future<void> insertTodo(TodoModel todoModel);

  Future<void> deleteTodos();
  Future<void> deleteTodoById(int id);
  Future<void> updateTodoById(int id, TodoModel todoModel);
  Future<List<TodoModel>> fetchTodos();
}
