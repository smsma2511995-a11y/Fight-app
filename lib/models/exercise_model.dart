class MartialArtsExercise {
  final int id;
  final String name;
  final String description;
  final String category; // Karate, Judo, etc.
  final int calories;

  MartialArtsExercise({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.calories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'calories': calories,
    };
  }

  factory MartialArtsExercise.fromMap(Map<String, dynamic> map) {
    return MartialArtsExercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      calories: map['calories'],
    );
  }
}
