import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_you_task/features/auth/data/api/login_api.dart';
import 'package:link_you_task/features/auth/presentation/viewmodel/login_cubit.dart';
import 'package:link_you_task/features/todo/data/api/todo_api.dart';
import 'package:link_you_task/features/todo/data/todo_local_repo.dart';
import 'package:provider/single_child_widget.dart';

import 'features/todo/presentation/viewmodel/todo_cubit.dart';

List<SingleChildWidget> providers = [
  BlocProvider<TodoCubit>(
    create: (context) => TodoCubit(localRepo: TodoLocalRepo(), remoteRepo: TodoApi(dio: Dio())),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(LoginApi(Dio())),
  )
];