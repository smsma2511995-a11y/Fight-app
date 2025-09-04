class Exercise {
  int? id;
  String name;
  String description;
  String videoUrl;

  Exercise({this.id, required this.name, required this.description, required this.videoUrl});

  Map<String, dynamic> toMap() {
    var map = {
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      videoUrl: map['videoUrl'],
    );
  }
}
