import 'package:drift/drift.dart';
import 'package:link_you_task/features/todo/data/todo_local_repo.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';

import '../../../db/database.dart';

class TodoLocalRepoImpl extends TodoLocalRepo{
  AppDb db;
  TodoLocalRepoImpl(this.db);
  @override
  Future<void> insertTodos(List<TodoModel> todoModels) async {
    for (var todoModel in todoModels) {
      await insertTodo(todoModel);
    }
  }
  @override
  Future<void> insertTodo(TodoModel todoModel) async {
    await db.into(db.todoTable).insert(TodoTableCompanion(
      id: Value(todoModel.id),
      userId: Value(todoModel.userId),
      completed: Value(todoModel.completed),
      todo: Value(todoModel.todo),
    ));
  }
  @override
  Future<void> deleteTodos() async {
    await db.delete(db.todoTable).go();
  }
  @override
  Future<void> deleteTodoById(int id) async {
    await (db.delete(db.todoTable)..where((t) => t.id.equals(id))).go();
  }
  @override
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
  @override
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