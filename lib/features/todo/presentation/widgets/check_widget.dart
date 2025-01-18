import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CheckWidget extends StatelessWidget {
  const CheckWidget({
    super.key,
    required this.completed,
  });

  final completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: completed ? Icon(Icons.check, color: Colors.green) : null,
    );
  }
}