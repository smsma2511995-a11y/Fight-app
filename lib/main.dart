import 'package:flutter/material.dart';
import 'data/database_helper.dart';
import 'models/exercise_model.dart';
import 'screens/exercises_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();

  // Insert sample exercises once
  final exercises = [
    MartialArtsExercise(
        id: 1,
        name: "Front Kick",
        description: "A basic karate front kick",
        category: "Karate",
        calories: 20),
    MartialArtsExercise(
        id: 2,
        name: "Throw",
        description: "Judo shoulder throw",
        category: "Judo",
        calories: 35),
  ];

  for (var ex in exercises) {
    await dbHelper.insertExercise(ex);
  }

  runApp(const FightApp());
}

class FightApp extends StatelessWidget {
  const FightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fight App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExercisesScreen(),
    );
  }
}
