import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/features/auth/presentation/pages/login_page.dart';
import 'package:link_you_task/features/todo/presentation/pages/todo_page.dart';
import 'package:link_you_task/features/user/user_repo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    UserRepo().getUser().then((value) {
      if (value == null) {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(TodoPage.routeName);
      }
    });
    return Scaffold(
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
