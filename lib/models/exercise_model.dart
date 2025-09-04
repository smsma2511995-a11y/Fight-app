// Unified Exercise model (supports legacy fields) + compatibility MartialArtsExercise.
class Exercise {
  int? id;
  String name;
  String description;
  String videoUrl;

  // various image fields (some seeds use image, imageUrl, gif, gifUrl, imagePath)
  String? image;
  String? imageUrl;
  String? gif;
  String? gifUrl;
  String? imagePath;

  // metadata
  String? category;
  String? duration; // human readable "30s" / "30 ثانية"
  int? durationSeconds;
  int? calories;
  String? type; // legacy
  String? value; // legacy/display

  Exercise({
    this.id,
    required this.name,
    required this.description,
    this.videoUrl = '',
    this.image,
    this.imageUrl,
    this.gif,
    this.gifUrl,
    this.imagePath,
    this.category,
    this.duration,
    this.durationSeconds,
    this.calories,
    this.type,
    this.value,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'image': image,
      'imageUrl': imageUrl,
      'gif': gif,
      'gifUrl': gifUrl,
      'imagePath': imagePath,
      'category': category,
      'duration': duration,
      'durationSeconds': durationSeconds,
      'calories': calories,
      'type': type,
      'value': value,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] is int ? map['id'] as int : (map['id'] == null ? null : int.tryParse(map['id'].toString())),
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      videoUrl: (map['videoUrl'] ?? map['video'] ?? '') as String,
      image: map['image'] as String?,
      imageUrl: map['imageUrl'] as String? ?? map['image'] as String?,
      gif: map['gif'] as String?,
      gifUrl: map['gifUrl'] as String? ?? map['gif'] as String?,
      imagePath: map['imagePath'] as String?,
      category: map['category'] as String?,
      duration: map['duration'] as String?,
      durationSeconds: map['durationSeconds'] is int
          ? map['durationSeconds'] as int
          : (map['durationSeconds'] == null ? null : int.tryParse(map['durationSeconds'].toString())),
      calories: map['calories'] is int ? map['calories'] as int : (map['calories'] == null ? null : int.tryParse(map['calories'].toString())),
      type: map['type'] as String?,
      value: map['value'] as String?,
    );
  }

  // Convenience getter to prefer imageUrl -> image -> gifUrl -> gif -> imagePath
  String? get displayImage {
    return imageUrl ?? image ?? gifUrl ?? gif ?? imagePath;
  }
}

/// Backwards-compatible helper class used in many seeds.
/// Many seed files construct MartialArtsExercise(...) — keep compatibility.
class MartialArtsExercise {
  final String name;
  final String description;
  final String? imageUrl;
  final String? gifUrl;
  final String? videoUrl;
  final int? durationSeconds;
  final int? calories;
  final String? category;
  final int? duration;
  final String? image;
  final String? imagePath;
  final String? type;
  final String? value;

  MartialArtsExercise({
    required this.name,
    required this.description,
    this.imageUrl,
    this.gifUrl,
    this.videoUrl,
    this.durationSeconds,
    this.calories,
    this.category,
    this.duration,
    this.image,
    this.imagePath,
    this.type,
    this.value,
  });

  Exercise toExercise() {
    return Exercise(
      name: name,
      description: description,
      videoUrl: videoUrl ?? '',
      imageUrl: imageUrl ?? gifUrl,
      gifUrl: gifUrl,
      image: image,
      imagePath: imagePath,
      durationSeconds: durationSeconds,
      calories: calories,
      category: category,
      duration: duration != null ? '${duration!} ثانية' : null,
      type: type,
      value: value,
    );
  }
}
