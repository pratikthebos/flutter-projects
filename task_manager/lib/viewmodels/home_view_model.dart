import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../services/fake_task_service.dart';

class HomeViewModel extends ChangeNotifier {
  final List<TaskModel> tasks = FakeTaskService.tasks;

  int get completedTasks =>
      tasks.where((e) => e.completed).length;

  int get pendingTasks =>
      tasks.where((e) => !e.completed).length;

  int get totalTasks => tasks.length;

  void completeTask(TaskModel task) {
    task.completed = true;
    notifyListeners();
  }
}