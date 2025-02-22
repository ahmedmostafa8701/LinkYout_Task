import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_you_task/features/auth/domain/repo/login_repo.dart';
import 'package:link_you_task/features/user/user_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo, this.userRepo) : super(LoginInitial());
  LoginRepo loginRepo;
  UserRepo userRepo;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;
  Future<void> login() async{
    emit(LoginLoading());
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var user = await loginRepo.login(usernameController.text, passwordController.text).timeout(const Duration(seconds: 10));
      if(user != null){
        userRepo.addUser(user);
        emit(LoginSuccess());
      }else{
        emit(LoginFailure(message: 'Invalid username or password'));
      }
    } else {
      emit(LoginFailure(message: 'Enter username and password'));
    }
  }
}