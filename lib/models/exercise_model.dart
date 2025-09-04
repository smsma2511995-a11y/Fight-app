class Exercise {
  final int? id;
  final String name;
  final String description;
  final String videoUrl;
  final String? localPath; // الملف بعد التخزين

  Exercise({
    this.id,
    required this.name,
    required this.description,
    required this.videoUrl,
    this.localPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'localPath': localPath,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      videoUrl: map['videoUrl'],
      localPath: map['localPath'],
    );
  }
}
