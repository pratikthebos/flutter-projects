class TaskModel {
  final String id;

  final String title;

  final String description;

  final String category;

  final String priority;

  final String dueDate;

  final double progress;

  bool completed;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.dueDate,
    required this.progress,
    this.completed = false,
  });
}