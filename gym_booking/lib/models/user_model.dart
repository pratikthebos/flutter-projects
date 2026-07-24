class UserModel {
  final String name;
  final String membership;
  final int calories;
  final int workoutMinutes;
  final double bmi;
  final String avatar;

  const UserModel({
    required this.name,
    required this.membership,
    required this.calories,
    required this.workoutMinutes,
    required this.bmi,
    required this.avatar,
  });
}