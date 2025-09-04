// Utility to normalize various seed formats into List<Exercise>.
import '../models/exercise_model.dart';

List<Exercise> normalizeList(dynamic seed) {
  if (seed == null) return [];

  // Already a List<Exercise>
  if (seed is List<Exercise>) return List<Exercise>.from(seed);

  // Generic List (might contain Exercise, MartialArtsExercise, or Map)
  if (seed is List) {
    final out = <Exercise>[];
    for (final item in seed) {
      if (item is Exercise) {
        out.add(item);
      } else if (item is MartialArtsExercise) {
        out.add(item.toExercise());
      } else if (item is Map<String, dynamic>) {
        out.add(_fromMapFlexible(item));
      }
    }
    return out;
  }

  // Map container with key "exercises" -> list
  if (seed is Map<String, dynamic>) {
    if (seed['exercises'] is List) {
      return normalizeList(seed['exercises']);
    } else {
      return [_fromMapFlexible(seed)];
    }
  }

  return [];
}

Exercise _fromMapFlexible(Map<String, dynamic> map) {
  return Exercise(
    id: map['id'] is int ? map['id'] as int : (map['id'] == null ? null : int.tryParse(map['id'].toString())),
    name: (map['name'] ?? map['title'] ?? '') as String,
    description: (map['description'] ?? '') as String,
    videoUrl: (map['videoUrl'] ?? map['video'] ?? '') as String,
    imageUrl: (map['imageUrl'] ?? map['image'] ?? map['gif'] ?? '') as String?,
    gifUrl: map['gif'] as String?,
    image: map['image'] as String?,
    imagePath: map['imagePath'] as String?,
    durationSeconds: map['durationSeconds'] is int
        ? map['durationSeconds'] as int
        : (map['duration'] is int ? map['duration'] as int : null),
    category: map['category'] as String?,
    calories: map['calories'] is int ? map['calories'] as int : (map['calories'] == null ? null : int.tryParse(map['calories'].toString())),
    type: map['type'] as String?,
    value: map['value'] as String?,
  );
}
