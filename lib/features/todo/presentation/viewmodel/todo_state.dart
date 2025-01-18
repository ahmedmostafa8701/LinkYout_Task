import '../../domain/model/todo_model.dart';

class TodoState{}
class TodoInitial extends TodoState{}
class TodoLoading extends TodoState{}
class TodoFailure extends TodoState{
  final String message;

  TodoFailure({required this.message});
}
class TodoSuccess extends TodoState{
  final List<TodoModel> todos;
  final String message;
  TodoSuccess({required this.todos, required this.message});
}