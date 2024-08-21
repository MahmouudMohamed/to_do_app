import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromFire(snapshot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toStore();
      },
    );
  }

  static void addTask(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }


  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date){
    var collection = getTasksCollection();
    return collection.where("date",isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch ).snapshots();
  }


  static Future<void> deleteTask(String id){
    return getTasksCollection().doc(id).delete();

  }



  static Future<void> updateTask(TaskModel modelUpdate){
    return getTasksCollection().doc(modelUpdate.id).update(modelUpdate.toStore());

  }
}
