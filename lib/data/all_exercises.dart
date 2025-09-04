// Provide allExercisesList for files that expect that name.
import 'martial_exercises.dart' as _m;
import '../models/exercise_model.dart';

// martial_exercises.dart defines `final List<Exercise> allExercises = [...]`.
// Expose the same data as `allExercisesList` to avoid renaming everywhere.
final List<Exercise> allExercisesList = List<Exercise>.from(_m.allExercises);
