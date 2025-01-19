import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/features/todo/presentation/pages/todo_page.dart';

import '../../../todo/presentation/viewmodel/todo_cubit.dart';
import '../viewmodel/login_cubit.dart';
import '../viewmodel/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textScheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccess){
            cubit.passwordController.clear();
            cubit.usernameController.clear();
            BlocProvider.of<TodoCubit>(context).sync();
            Navigator.popAndPushNamed(context, TodoPage.routeName);
          }else if(state is LoginFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid username or password')));
          }
        },
        builder: (context, state) {
          if(state is LoginLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16.h,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'User Name',
                    ),
                    controller: cubit.usernameController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(cubit.passwordHidden ? Icons.visibility_off: Icons.visibility, color: colorScheme.primary,),
                        onPressed: (){
                          setState(() {
                            cubit.passwordHidden = !cubit.passwordHidden;
                          });
                        },
                      ),
                    ),
                    controller: cubit.passwordController,
                    obscureText: cubit.passwordHidden,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      textStyle: textScheme.titleLarge,
                    ),
                    onPressed: () {
                      cubit.login();
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
