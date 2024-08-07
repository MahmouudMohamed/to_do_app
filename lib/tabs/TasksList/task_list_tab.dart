import 'package:flutter/material.dart';
import 'package:to_do_app/app_color.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("To Do List"),
      ),
    );
  }
}
