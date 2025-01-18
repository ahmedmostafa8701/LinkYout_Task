import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_state.dart';

import '../../domain/repo/todo_repo.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoCubit({
    required this.remoteRepo,
    required this.localRepo,
  }) : super(TodoInitial()){
    sync();
  }
  final TodoRepo remoteRepo;
  final TodoRepo localRepo;
  List<TodoModel> _testingList = [
    TodoModel(id: 0, todo: 'Todo 1', completed: true, userId: 1),
    TodoModel(id: 1, todo: 'Todo 2', completed: false, userId: 1),
    TodoModel(id: 2, todo: 'Todo 3', completed: true, userId: 1),
    TodoModel(id: 3, todo: 'Todo 4', completed: false, userId: 1),
  ];
  List<TodoModel> todos = [];
  void sync() async{
    emit(TodoLoading());
    try{
      todos = await remoteRepo.fetchTodos();
      emit(TodoSuccess(todos: todos, message: 'Todos fetched successfully'));
    }catch(e){
      emit(TodoFailure(message: e.toString()));
    }
  }
  void addTodo(TodoModel todoModel) async{
    emit(TodoLoading());
    try{
      await remoteRepo.addTodo(todoModel);
      todos.add(todoModel);
      emit(TodoSuccess(todos: todos, message: 'Added successfully'));
    }catch(e){
      emit(TodoFailure(message: e.toString()));
    }
  }
  void editTodo(int id, TodoModel todoModel) async{
    emit(TodoLoading());
    try{
      await remoteRepo.editTodo(id, todoModel);
      todos[todos.indexWhere((element) => element.id == id)] = todoModel;
      emit(TodoSuccess(todos: todos, message: 'Edited successfully'));
    }catch(e){
      emit(TodoFailure(message: e.toString()));
    }
  }
  void deleteTodo(int id) async{
    emit(TodoLoading());
    try{
      await remoteRepo.deleteTodo(id);
      todos.removeWhere((element) => element.id == id);
    }catch(e){
      emit(TodoFailure(message: e.toString()));
    }
    emit(TodoSuccess(todos: todos, message: 'Deleted successfully'));
  }
}