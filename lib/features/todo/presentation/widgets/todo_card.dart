import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/core/widgets/custom_card.dart';

import '../../domain/model/todo_model.dart';
import 'check_widget.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    required this.todoModel,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final void Function() onDelete;
  final void Function(TodoModel todoModel) onEdit;
  final TodoModel todoModel;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.todoModel.completed = !widget.todoModel.completed;
                widget.onEdit(widget.todoModel);
              });
            },
            child: CheckWidget(
              completed: widget.todoModel.completed,
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 250.w,
            child: TextField(
              style: isEditing ? textTheme.bodyMedium : textTheme.titleMedium,
              controller: TextEditingController(text: widget.todoModel.todo),
              decoration: InputDecoration(
                enabled: isEditing,
                disabledBorder: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isCollapsed: true,
              ),
              onChanged: (value) {
                widget.todoModel.todo = value;
              },
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: widget.onDelete,
            child: Icon(
              Icons.delete,
              color: colorScheme.error,
            ),
          ),
          SizedBox(width: 6.w),
          GestureDetector(
            onTap: () {
              if(widget.todoModel.todo.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Todo cannot be empty')));
                return;
              }
              setState(() {
                isEditing = !isEditing;
              });
              if (isEditing == false) {
                widget.onEdit(widget.todoModel);
              }
            },
            child: Icon(
              isEditing ? Icons.check : Icons.edit,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
