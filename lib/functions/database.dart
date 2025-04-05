import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addTask(Map<String, dynamic> writeTask, String id) async {
    await FirebaseFirestore.instance.collection('tasks').doc(id).set(writeTask);
  }
}
