import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_card.dart';
import '../../domain/model/todo_model.dart';
import 'check_widget.dart';

class AddTodoCard extends StatefulWidget {
  final void Function(TodoModel todoModel) onAdd;

  const AddTodoCard({required this.onAdd, super.key});

  @override
  State<AddTodoCard> createState() => _AddTodoCardState();
}

class _AddTodoCardState extends State<AddTodoCard> {
  final TextEditingController controller = TextEditingController();
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CustomCard(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {completed = !completed;});
            },
            child: CheckWidget(completed: completed),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 250.w,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter todo',
                isCollapsed: true,
              ),
              controller: controller,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: controller.text.isNotEmpty ? (){
              widget.onAdd(TodoModel(todo: controller.text, completed: completed, id: 0, userId: 1));
              controller.clear();
              setState(() {
                completed = false;
              });
            }:null,
            child: Icon(Icons.check, color: controller.text.isNotEmpty ? colorScheme.primary : Colors.grey),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
  }
}