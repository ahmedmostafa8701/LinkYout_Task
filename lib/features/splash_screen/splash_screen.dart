import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/db/database.dart';
import 'package:link_you_task/features/auth/presentation/pages/login_page.dart';
import 'package:link_you_task/features/todo/presentation/pages/todo_page.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_cubit.dart';
import 'package:link_you_task/features/user/user_repo_impl.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    UserRepoImpl(AppDb()).getUser().then((value) {
      if (value == null) {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      } else {
        BlocProvider.of<TodoCubit>(context).sync();
        Navigator.of(context).pushReplacementNamed(TodoPage.routeName);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Task'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Catalyst Task',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 20.h),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
