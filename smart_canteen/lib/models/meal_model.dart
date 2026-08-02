class MealModel {
  final String mealType;
  final String date;
  final List<String> items;
  final int totalMeals;
  final bool completed;

  MealModel({
    required this.mealType,
    required this.date,
    required this.items,
    required this.totalMeals,
    required this.completed,
  });
}