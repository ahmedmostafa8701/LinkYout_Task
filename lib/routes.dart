import 'package:flutter/material.dart';
import 'package:link_you_task/features/todo/presentation/pages/todo_page.dart';

import 'features/auth/presentation/pages/login_page.dart';
import 'main.dart';

final Map<String, WidgetBuilder> routes = {
  TodoPage.routeName: (context) => const TodoPage(),
  LoginPage.routeName: (context) => const LoginPage(),
};