import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/core/widgets/custom_card.dart';
import 'package:link_you_task/features/auth/presentation/pages/login_page.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_cubit.dart';
import 'package:link_you_task/features/todo/presentation/viewmodel/todo_state.dart';
import 'package:link_you_task/features/todo/presentation/widgets/check_widget.dart';
import 'package:link_you_task/features/todo/presentation/widgets/todo_list_view.dart';

import '../../domain/model/todo_model.dart';
import '../widgets/add_todo_cart.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  static const String routeName = '/todo';

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          GestureDetector(
            child: Icon(Icons.sync),
            onTap: () {
              cubit.sync();
            },
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () {
              cubit.logout();
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is TodoSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LogoutSuccessState) {
            Navigator.of(context).popAndPushNamed(LoginPage.routeName);
          }
          setState(() {});
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: cubit.state is TodoLoading
                  ? Container(
                      child: CircularProgressIndicator(),
                      height: 50.h,
                      alignment: Alignment.center,
                    )
                  : null,
            ),
            SliverFillRemaining(
              child: TodoListView(
                todos: cubit.todos,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard height
          ),
          child: AddTodoCard(onAdd: (todoModel){
            cubit.addTodo(todoModel);
          }),
        ),
      ),
    );
  }
}
