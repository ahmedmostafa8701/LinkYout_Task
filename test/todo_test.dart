import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_cubit.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_state.dart';
import 'package:link_you_task/features/user/user_repo.dart';

import 'mockRepos/mock_login_repo.dart';
import 'mockRepos/mock_user_repo.dart';
import 'mockRepos/todo_mock_api.dart';
import 'mockRepos/todo_mock_local_repo.dart';

void main() {
  group('TodoCubit', () {
    late TodoCubit todoCubit;
    late UserRepo userRepo;
    setUp(() {
      userRepo = MockUserRepo();
      todoCubit = TodoCubit(
          remoteRepo: TodoMockApi(),
          localRepo: TodoMockLocalRepo(),
          userRepo: userRepo);
    });
    tearDown(() {
      todoCubit.close();
    });
    test('initial state is Initial, loading, logout', () {
      expect(todoCubit.state, TodoInitial());
    });
    blocTest<TodoCubit, TodoState>(
      'logout while fetching todos, fetching successfully, added successfully, edited successfully, deleted successfully, failed to add',
      build: () => todoCubit,
      act: (cubit) async{
        // fetching without user
        await cubit.sync();
        await userRepo.addUser(MockLoginRepo().users[0]);
        //fetching with user
        await cubit.sync();
        await cubit.addTodo(TodoModel(id: 1, userId: 1, completed: false, todo: 'Todo 1'));
        await cubit.editTodo(1, TodoModel(id: 1, userId: 1, completed: true, todo: 'Todo 1'));
        await cubit.deleteTodo(1);
      },
      expect: () => [
        TodoLoading(),
        LogoutSuccessState(), TodoLoading(),
        TodoSuccess(todos: [], message: 'Todos fetched successfully'),
        TodoLoading(),
        TodoSuccess(todos: [TodoModel(id: 1, userId: 1, completed: false, todo: 'Todo 1')].toList(), message: 'Added successfully'),
        TodoLoading(),
        TodoSuccess(todos: [TodoModel(id: 1, userId: 1, completed: true, todo: 'Todo 1')].toList(), message: 'Edited successfully'),
        TodoLoading(),
        TodoSuccess(todos: [], message: 'Deleted successfully'),
      ].toList(),
    );
  });
}
