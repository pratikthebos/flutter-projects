import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskDetailsViewModel extends ChangeNotifier {
  TaskModel? task;

  void setTask(TaskModel value) {
    task = value;
    notifyListeners();
  }
}