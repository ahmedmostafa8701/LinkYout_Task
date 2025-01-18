import 'package:flutter/material.dart';
import 'package:link_you_task/features/splash_screen/splash_screen.dart';
import 'package:link_you_task/features/todo/presentation/pages/todo_page.dart';

import 'features/auth/presentation/pages/login_page.dart';
import 'main.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  TodoPage.routeName: (context) => const TodoPage(),
  LoginPage.routeName: (context) => const LoginPage(),
};