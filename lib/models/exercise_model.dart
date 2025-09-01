class MartialArtsExercise {
  final int id;
  final String name;
  final String description;
  final int duration; // بالثواني
  final int calories;
  final String category; // Karate, Judo, Taekwondo, ...

  const MartialArtsExercise({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.calories,
    required this.category,
  });

  factory MartialArtsExercise.fromJson(Map<String, dynamic> json) {
    return MartialArtsExercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      calories: json['calories'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'calories': calories,
      'category': category,
    };
  }
}
