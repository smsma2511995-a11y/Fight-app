// Alias file: expose martial_exercises.allExercises as allExercisesList
import 'martial_exercises.dart' as _m;
import '../models/exercise_model.dart';

// Ensure we always expose a List<Exercise> named allExercisesList
final List<Exercise> allExercisesList = List<Exercise>.from(_m.allExercises);
