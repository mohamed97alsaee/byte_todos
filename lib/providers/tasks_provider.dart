import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  addTask(TaskModel tm) {
    tasks.add(tm);
    notifyListeners();
  }

  deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  clearTasksList() {
    tasks.clear();
    notifyListeners();
  }

  switchStatus(index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
}
