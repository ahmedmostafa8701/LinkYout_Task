import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/providers.dart';
import 'package:link_you_task/routes.dart';
import 'package:link_you_task/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 844),
        // Replace with your design's width and height
        minTextAdapt: true,
        // Ensures text scales appropriately
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Catalyst Task',
            theme: theme,
            routes: routes,
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}