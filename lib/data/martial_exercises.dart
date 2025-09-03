import '../models/exercise_model.dart';
import 'karate_seed.dart';
import 'judo_seed.dart';
import 'taekwondo_seed.dart';
import 'muaythai_seed.dart';
import 'streetfighting_seed.dart';
import 'musclebuilding_seed.dart';
import 'weapondefense_seed.dart';
import 'wrestling_seed.dart';
import 'kungfu_seed.dart';
import 'kickboxing_seed.dart';
import 'boxing_seed.dart';
import 'bjj_seed.dart';
import 'aikido_seed.dart';
import 'flexibility_seed.dart';
import 'hipopening_seed.dart';
import 'reaction_defense_seed.dart'; // ✅ الجديد

final List<Exercise> allExercises = [
  ...karateExercises,
  ...judoExercises,
  ...taekwondoExercises,
  ...muaythaiExercises,
  ...streetFightingExercises,
  ...muscleBuildingExercises,
  ...weaponDefenseExercises,
  ...wrestlingExercises,
  ...kungfuExercises,
  ...kickboxingExercises,
  ...boxingExercises,
  ...bjjExercises,
  ...aikidoExercises,
  ...flexibilityExercises,
  ...hipOpeningExercises,
  ...reactionDefenseExercises, // ✅ الجديد
];
