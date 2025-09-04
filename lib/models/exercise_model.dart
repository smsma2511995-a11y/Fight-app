// Unified Exercise model (supports legacy fields used in seed files).
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
      videoUrl: (map['videoUrl'] ?? '') as String,
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
