import 'package:flutter/material.dart';

import '../firebase/firebase_functions.dart';
import '../model/task_model.dart';

class GetDate extends ChangeNotifier {
  DateTime selectDate = DateTime.now();
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();


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
    return date;
  }

  void addCheckTask() {
    if (formkey.currentState?.validate() == true) {
      TaskModel model = TaskModel(
          title: titleController.text,
          description: descriptionController.text,
          date: DateUtils.dateOnly(selectDate).millisecondsSinceEpoch);
      FirebaseFunctions.addTask(model);
      notifyListeners();
    }
    notifyListeners();
  }
}