import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../models/exercise_model.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final dbHelper = DatabaseHelper();
  List<MartialArtsExercise> exercises = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final data = await dbHelper.getAllExercises();
    setState(() {
      exercises = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Martial Arts Exercises")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return ListTile(
            title: Text(ex.name),
            subtitle: Text(ex.description),
          );
        },
      ),
    );
  }
}
