import '../../domain/model/todo_model.dart';
import 'package:equatable/equatable.dart';
class TodoState extends Equatable{
  @override
  List<Object?> get props => [];
}
class TodoInitial extends TodoState{}
class TodoLoading extends TodoState{}
class TodoFailure extends TodoState{
  final String message;
  TodoFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
class TodoSuccess extends TodoState{
  final List<TodoModel> todos;
  final String message;
  TodoSuccess({required this.todos, required this.message});
  @override
  List<Object?> get props => [message, todos];
}
class LogoutSuccessState extends TodoState{}