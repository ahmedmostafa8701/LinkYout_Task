import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_you_task/features/auth/domain/model/user_model.dart';
import 'package:link_you_task/features/todo/data/todo_local_repo.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_state.dart';
import 'package:link_you_task/features/user/user_repo.dart';

import '../../domain/repo/todo_repo.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoCubit({
    required this.remoteRepo,
    required this.localRepo,
    required this.userRepo
  }) : super(TodoInitial());
  final TodoRepo remoteRepo;
  final TodoLocalRepo localRepo;
  UserRepo userRepo;
  UserModel ?user;
  List<TodoModel> todos = [];
  Future<void> sync() async{
    if(user == null){
      user = await userRepo.getUser();
    }
    emit(TodoLoading());
    try{
      if(user == null || user?.id == null){
        logout();
        return;
      }
      todos = List.from(await remoteRepo.fetchTodos(user!.id!).timeout(const Duration(seconds: 7)));
      emit(TodoSuccess(todos: todos, message: 'Todos fetched successfully'));
      await localRepo.deleteTodos();
      await localRepo.insertTodos(todos);
    }catch(e){
      todos = await localRepo.fetchTodos();
      emit(TodoFailure(message: 'Failed to sync'));
    }
  }
  void logout() async{
    emit(TodoLoading());
    try{
      await userRepo.deleteUser();
      emit(LogoutSuccessState());
    }catch(e){
      emit(TodoFailure(message: "Failed to logout"));
    }
  }
  Future<void> addTodo(TodoModel todoModel) async{
    emit(TodoLoading());
    try{
      todos.add(todoModel);
      await remoteRepo.addTodo(todoModel).timeout(const Duration(seconds: 7));
      emit(TodoSuccess(todos: todos.toList(), message: 'Added successfully'));
    }catch(e){
      emit(TodoFailure(message: 'Failed to add remotely'));
    }
    await localRepo.insertTodo(todoModel);
  }
  Future<void> editTodo(int id, TodoModel todoModel) async{
    emit(TodoLoading());
    try{
      todos[todos.indexWhere((element) => element.id == id)] = todoModel;
      await remoteRepo.editTodo(id, todoModel).timeout(const Duration(seconds: 7));
      emit(TodoSuccess(todos: todos.toList(), message: 'Edited successfully'));
    }catch(e){
      emit(TodoFailure(message: 'Failed to edit remotely'));
    }
    await localRepo.updateTodoById(id, todoModel);
  }
  Future<void> deleteTodo(int id) async{
    emit(TodoLoading());
    try{
      todos.removeWhere((element) => element.id == id);
      await remoteRepo.deleteTodo(id).timeout(const Duration(seconds: 7));
      emit(TodoSuccess(todos: todos.toList(), message: 'Deleted successfully'));
    }catch(e){
      emit(TodoFailure(message: 'Failed to delete remotely'));
    }
    await localRepo.deleteTodoById(id);
  }
}