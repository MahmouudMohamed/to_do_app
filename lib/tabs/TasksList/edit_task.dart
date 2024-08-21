import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';
import 'package:to_do_app/tabs/TasksList/custom_textFormField_edit.dart';

import '../../Providers/get_date.dart';
import '../../app_color.dart';
import '../../model/task_model.dart';

class EditTask extends StatelessWidget {
  static const String routeName = "edit";

  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as TaskModel;
    var proDate = Provider.of<GetDate>(context);
    var formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "todo".tr(),
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: Form(
        key: formkey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Edit Task",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  CustomTextFormFieldEdit(
                    hint: model.title,
                    // controller: titleController,
                    length: 20,
                    errorText: "Please Enter Your Task Title",
                    onChanged: (value) {
                      print(value);
                      model.title = value;
                    },
                  ),
                  CustomTextFormFieldEdit(
                    hint: model.description,
                    lines: 4,
                    errorText: "Please Enter Your Task Details",
                    onChanged: (value) {
                      model.description = value;
                    },
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
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        proDate.getCalendar(context);
                      },
                      child: Text(
                        "${model.date}".substring(0, 10),
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
                        model.date = DateUtils.dateOnly(proDate.selectDate)
                            .millisecondsSinceEpoch;
                        FirebaseFunctions.updateTask(model);
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
