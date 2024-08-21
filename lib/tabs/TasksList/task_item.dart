import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/tabs/TasksList/edit_task.dart';
import 'package:to_do_app/tabs/TasksList/row_of_task.dart';

import '../../app_color.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;

  TaskItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(25)),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Slidable(
            endActionPane:
                ActionPane(motion: DrawerMotion(), extentRatio: 0.5, children: [
              SlidableAction(
                  onPressed: (context) {
                    FirebaseFunctions.deleteTask(model.id);
                  },
                  label: "Delete",
                  backgroundColor: AppColor.redColor,
                  autoClose: true,
                  icon: Icons.delete,
                  borderRadius: context.locale == Locale("en")
                      ? BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25))
                      : BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)))
            ]),
            startActionPane:
                ActionPane(motion: DrawerMotion(), extentRatio: 0.5, children: [
              SlidableAction(
                onPressed: (context) {
                  Navigator.pushNamed(
                    context,
                    EditTask.routeName,
                  arguments: model);
                },
                label: "Edit",
                backgroundColor: AppColor.primaryColor,
                autoClose: true,
                icon: Icons.edit,
                borderRadius: context.locale == Locale("en")
                    ? BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25))
                    : BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
              )
            ]),
            child: RowOfTask(model: model)));
  }
}
