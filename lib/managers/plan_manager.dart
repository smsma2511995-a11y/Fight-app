import 'dart:math';
import '../models/exercise_model.dart';
import '../data/all_exercises.dart';

class PlanManager {
  int currentDay = 1;
  Map<int, List<Exercise>> plan = {};
  int difficultyLevel = 1; // 1 مبتدئ - 5 متقدم

  PlanManager() {
    _generateDayPlan(currentDay);
  }

  void _generateDayPlan(int day) {
    final random = Random();

    // تقسيم التمارين لمجموعات
    List<Exercise> warmups = allExercises.where((ex) => ex.category == "warmup").toList();
    List<Exercise> strength = allExercises.where((ex) => ex.category == "strength").toList();
    List<Exercise> martial = allExercises.where((ex) => ex.category == "martial").toList();
    List<Exercise> flexibility = allExercises.where((ex) => ex.category == "flexibility").toList();

    warmups.shuffle();
    strength.shuffle();
    martial.shuffle();
    flexibility.shuffle();

    // اختيار حسب المستوى
    int warmCount = 2;
    int strCount = (difficultyLevel >= 3) ? 4 : 3;
    int martCount = (difficultyLevel >= 4) ? 5 : 3;
    int flexCount = (difficultyLevel >= 2) ? 3 : 2;

    plan[day] = [
      ...warmups.take(warmCount),
      ...strength.take(strCount),
      ...martial.take(martCount),
      ...flexibility.take(flexCount),
    ];
  }

  List<Exercise> getTodayPlan() {
    return plan[currentDay] ?? [];
  }

  void submitFeedback(int rating) {
    if (rating >= 4 && difficultyLevel < 5) {
      difficultyLevel++;
    } else if (rating <= 2 && difficultyLevel > 1) {
      difficultyLevel--;
    }

    currentDay++;
    _generateDayPlan(currentDay);
  }
}
