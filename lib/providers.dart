import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_you_task/db/database.dart';
import 'package:link_you_task/features/auth/data/api/login_api.dart';
import 'package:link_you_task/features/auth/presentation/viewmodel/login_cubit.dart';
import 'package:link_you_task/features/todo/data/api/todo_api.dart';
import 'package:link_you_task/features/todo/data/todo_local_repo_impl.dart';
import 'package:link_you_task/features/user/user_repo_impl.dart';
import 'package:provider/single_child_widget.dart';

import 'features/todo/presentation/viewmodel/todo_cubit.dart';

List<SingleChildWidget> providers = [
  BlocProvider<TodoCubit>(
    create: (context) => TodoCubit(
        localRepo: TodoLocalRepoImpl(AppDb()),
        remoteRepo: TodoApi(dio: Dio()),
        userRepo: UserRepoImpl(AppDb())),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(LoginApi(Dio()), UserRepoImpl(AppDb())),
  )
];
