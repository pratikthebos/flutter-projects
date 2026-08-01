class LearningStepModel {
  final int step;
  final String title;
  final String subtitle;
  final String explanation;
  bool completed;

  LearningStepModel({
    required this.step,
    required this.title,
    required this.subtitle,
    required this.explanation,
    this.completed = false,
  });
}