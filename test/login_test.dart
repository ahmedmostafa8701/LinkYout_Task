import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_you_task/features/auth/presentation/viewmodel/login_cubit.dart';
import 'package:link_you_task/features/auth/presentation/viewmodel/login_state.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_cubit.dart';

import 'mockRepos/mock_login_repo.dart';
import 'mockRepos/mock_user_repo.dart';

void main() {
  group('TodoCubit', () {
    late TodoCubit todoCubit;
    late LoginCubit loginCubit;
    setUp(() {
      loginCubit = LoginCubit(MockLoginRepo(), MockUserRepo());
    });

    tearDown(() {
      loginCubit.close();
    });
    test('initial state is Initial', () {
      expect(loginCubit.state, LoginInitial());
    });
    blocTest<LoginCubit, LoginState>(
      'Invalid username or password',
      build: () => loginCubit,
      act: (cubit) {
        cubit.usernameController.text = 'user';
        cubit.passwordController.text = 'password';
        cubit.login();
      },
      expect: () => [LoginLoading(), LoginFailure(message: 'Invalid username or password')].toList(),
    );
    blocTest<LoginCubit, LoginState>(
      'Enter username and password',
      build: () => loginCubit,
      act: (cubit) {
        cubit.usernameController.text = '';
        cubit.passwordController.text = '';
        cubit.login();
      },
      expect: () => [LoginLoading(), LoginFailure(message: 'Enter username and password')].toList(),
    );
    blocTest<LoginCubit, LoginState>(
      'Enter username and password',
      build: () => loginCubit,
      act: (cubit){
        cubit.usernameController.text = 'user1';
        cubit.passwordController.text = 'password1';
        cubit.login();
      },
      expect: () => [LoginLoading(), LoginSuccess()].toList(),
    );
  });
}