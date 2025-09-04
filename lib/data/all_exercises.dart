// Collect and normalize all seed sources into a single List<Exercise>
import '../models/exercise_model.dart';
import 'seed_converter.dart';

// IMPORT each seed source that exists in the repo
import 'karate_seed.dart' as _karate;
import 'judo_seed.dart' as _judo;
import 'taekwondo_seed.dart' as _taekwondo;
import 'muaythai_seed.dart' as _muay;
import 'streetfighting_seed.dart' as _street;
import 'musclebuilding_seed.dart' as _muscle;
import 'weapondefense_seed.dart' as _weapon;
import 'wrestling_seed.dart' as _wrestling;
import 'kungfu_seed.dart' as _kungfu;
import 'kickboxing_seed.dart' as _kick;
import 'boxing_seed.dart' as _boxing;
import 'bjj_seed.dart' as _bjj;
import 'aikido_seed.dart' as _aikido;
import 'flexibility_seed.dart' as _flex;
import 'hipopening_seed.dart' as _hip;
import 'reactionDefenseExercises_seed.dart' as _reaction;
import 'martial_exercises.dart' as _maybe_all; // in case it already provides allExercises

final List<Exercise> allExercisesList = [
  // Prefer explicit normalized lists from seeds
  ...normalizeList(_karate.karateExercises),
  ...normalizeList(_judo.judoExercises),
  ...normalizeList(_taekwondo.taekwondoExercises),
  ...normalizeList(_muay.muaythaiExercises),
  ...normalizeList(_street.streetFighting),
  ...normalizeList(_muscle.muscleBuilding),
  ...normalizeList(_weapon.weaponDefense),
  ...normalizeList(_wrestling.wrestlingExercises),
  ...normalizeList(_kungfu.kungfuExercises),
  ...normalizeList(_kick.kickboxingExercises),
  ...normalizeList(_boxing.boxingExercises),
  ...normalizeList(_bjj.bjjExercises),
  ...normalizeList(_aikido.aikido),
  ...normalizeList(_flex.flexibility),
  ...normalizeList(_hip.hipOpening),
  ...normalizeList(_reaction.reactionDefenseExercises),

  // Fallback: if martial_exercises.dart already builds allExercises, include them (normalize to be safe)
  ...normalizeList(_maybe_all.allExercises),
];
