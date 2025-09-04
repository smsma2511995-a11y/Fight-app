class Exercise {
  final int? id;
  final String name;
  final String description;
  final String videoUrl;
  final String? cachedPath;

  Exercise({
    this.id,
    required this.name,
    required this.description,
    required this.videoUrl,
    this.cachedPath,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'videoUrl': videoUrl,
        'cachedPath': cachedPath,
      };

  factory Exercise.fromMap(Map<String, dynamic> map) => Exercise(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        videoUrl: map['videoUrl'],
        cachedPath: map['cachedPath'],
      );
}
