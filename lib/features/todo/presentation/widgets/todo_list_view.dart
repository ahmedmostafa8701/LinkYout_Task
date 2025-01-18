import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/features/todo/domain/model/todo_model.dart';
import 'package:link_you_task/features/todo/presentation/widgets/todo_card.dart';

import '../viewmodel/todo_cubit.dart';

class TodoListView extends StatelessWidget {
  List<TodoModel> todos;

  TodoListView({required this.todos, super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TodoCubit>(context);
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoCard(
          todoModel: todos[index],
          onDelete: () {
            cubit.deleteTodo(todos[index].id);
          },
          onEdit: (todoModel) {
            cubit.editTodo(todos[index].id, todoModel);
          },
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 16.h,
        );
      },
      padding: EdgeInsets.symmetric(
          vertical: 16.h, horizontal: 8.w),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
    );
  }
}
