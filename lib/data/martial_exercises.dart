import '../models/exercise_model.dart';
import 'karate_seed.dart';
import 'judo_seed.dart';
import 'taekwondo_seed.dart';

// ضيف باقي الملفات هنا لاحقًا لما نبعتها لك
final List<Exercise> allExercises = [
  ...karateExercises,
  ...judoExercises,
  ...taekwondoExercises,
];
