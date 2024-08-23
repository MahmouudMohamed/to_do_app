import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';
import 'package:to_do_app/model/task_model.dart';

import '../../Providers/get_date.dart';
import '../../app_color.dart';
import 'custom_tff.dart';

class AddTaskBtSheet extends StatefulWidget {
  AddTaskBtSheet({super.key});

  @override
  State<AddTaskBtSheet> createState() => _AddTaskBtSheetState();
}

class _AddTaskBtSheetState extends State<AddTaskBtSheet> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var proDate = Provider.of<GetDate>(context);
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "new_task".tr(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              key: formkey,
              child: Column(
                children: [
                  CustomTff(
                    controller: proDate.titleController,
                    length: 20,
                    hintTxt: "task_tittle".tr(),
                    errorText: "Please Enter Your Task",
                  ),
                  CustomTff(
                    controller: proDate.descriptionController,
                    lines: 4,
                    hintTxt: "task_de".tr(),
                    errorText: "Please Enter Your Task Details",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        "Select Date",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        proDate.getCalendar(context);
                      },
                      child: Text(
                        "${proDate.selectDate.day}/${proDate.selectDate.month}/${proDate.selectDate.year}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                  InkWell(
                    overlayColor: WidgetStateColor.transparent,
                    onTap: () {
                      if (formkey.currentState?.validate() == true) {
                        proDate.addCheckTask();
                        Navigator.pop(context);
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: 30,
                        ),
                        CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 25,
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  // void addCheckTask() {
  //   if (formkey.currentState?.validate() == true) {
  //     TaskModel model = TaskModel(
  //         title: titleController.text,
  //         description: descriptionController.text,
  //         date: DateUtils.dateOnly(proDate.selectDate).millisecondsSinceEpoch);
  //     FirebaseFunctions.addTask(model);
  //     Navigator.pop(context);
  //   }
  // }
}

// selectDate=date??selectDate;
