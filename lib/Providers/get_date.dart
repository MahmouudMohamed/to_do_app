import 'package:flutter/material.dart';

import '../firebase/firebase_functions.dart';
import '../model/task_model.dart';

class GetDate extends ChangeNotifier {
  DateTime selectDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TaskModel? task;

  Future<DateTime?> getCalendar(context) async {
    DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: selectDate,
        lastDate: DateTime.now().add(Duration(
          days: 10000,
        )));
    if (date != null) {
      selectDate = date;
      notifyListeners();
    }
  }
  addCheckTask() {
    TaskModel model = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        date: DateUtils.dateOnly(selectDate).millisecondsSinceEpoch);
    FirebaseFunctions.addTask(model);
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }
}
