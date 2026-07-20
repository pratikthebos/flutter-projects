class SprintModel {
  final String sprintName;
  final int progress;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int bugsFound;
  final int testCases;

  const SprintModel({
    required this.sprintName,
    required this.progress,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.bugsFound,
    required this.testCases,
  });
}