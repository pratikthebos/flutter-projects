class WorkoutModel {
  final String exercise;
  final int sets;
  final int reps;
  final bool completed;

  const WorkoutModel({
    required this.exercise,
    required this.sets,
    required this.reps,
    required this.completed,
  });
}