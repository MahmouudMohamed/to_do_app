import 'package:flutter/material.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';

import '../../../app_color.dart';
import '../../model/task_model.dart';

class RowOfTask extends StatelessWidget {
  TaskModel model;

  RowOfTask({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
              height: 80,
              width: 5,
              decoration: BoxDecoration(
                  color: model.isDone ? AppColor.greenColor : AppColor
                      .primaryColor,
                  borderRadius: BorderRadius.circular(35))),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    model.title,
                    style: model.isDone ? Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColor.greenColor) :
                    Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColor.primaryColor)
                ),
                Text(model.description),
              ],
            ),
          ),
          model.isDone ? Text("Done!!!!!!!!!!!", style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.
          copyWith(color: AppColor.greenColor)) : ElevatedButton(
              onPressed: () {
                model.isDone = true;
                FirebaseFunctions.updateTask(model);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Icon(
                Icons.done, color: Theme
                  .of(context)
                  .iconTheme
                  .color,

              ))
        ],
      ),
    );
  }
}
