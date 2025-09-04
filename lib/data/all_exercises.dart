// Alias: expose martial_exercises.allExercises as allExercisesList
// يساعد على توافق الاستيرادات القديمة مع الاسم new allExercisesList
import 'martial_exercises.dart' as _m;
import '../models/exercise_model.dart';

final List<Exercise> allExercisesList = List<Exercise>.from(_m.allExercises);
