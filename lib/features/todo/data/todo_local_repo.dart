import 'package:drift/drift.dart';
import 'package:link_you_task/db/database.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';

class TodoLocalRepo {
  var db = AppDb();

  Future<void> insertTodos(List<TodoModel> todoModels) async {
    for (var todoModel in todoModels) {
      await insertTodo(todoModel);
    }
  }

  Future<void> insertTodo(TodoModel todoModel) async {
    await db.into(db.todoTable).insert(TodoTableCompanion(
          id: Value(todoModel.id),
          userId: Value(todoModel.userId),
          completed: Value(todoModel.completed),
          todo: Value(todoModel.todo),
        ));
  }

  Future<void> deleteTodos() async {
    await db.delete(db.todoTable).go();
  }
  Future<void> deleteTodoById(int id) async {
    await (db.delete(db.todoTable)..where((t) => t.id.equals(id))).go();
  }
  Future<void> updateTodoById(int id, TodoModel todoModel) async {
    await db.update(db.todoTable)..where((t) => t.id.equals(id))..write(
      TodoTableCompanion(
        id: Value(todoModel.id),
        userId: Value(todoModel.userId),
        completed: Value(todoModel.completed),
        todo: Value(todoModel.todo),
      )
    );
  }
  Future<List<TodoModel>> fetchTodos() async{
    var todos = await db.select(db.todoTable).get();
    return todos.map((e) => TodoModel(
        id: e.id,
        userId: e.userId,
        completed: e.completed,
        todo: e.todo
      )
    ).toList();
  }
}
