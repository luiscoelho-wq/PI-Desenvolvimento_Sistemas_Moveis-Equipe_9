import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';

class TaskRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<Task>> getTasks(DateTime date) async {
    final userId = auth.currentUser!.uid;
    final snapshot = await db
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .where('date', isEqualTo: date.toIso8601String())
        .get();

    return snapshot.docs.map((d) => Task.fromMap(d.data())).toList();
  }

  Future<void> addTask(Task task) async {
    final userId = auth.currentUser!.uid;
    await db
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(task.id)
        .set(task.toMap());
  }

  Future<void> updateTask(Task task) async {
    final userId = auth.currentUser!.uid;
    await db
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(task.id)
        .update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    final userId = auth.currentUser!.uid;
    await db
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}
