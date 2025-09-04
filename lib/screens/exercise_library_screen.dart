import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../utils/database_helper.dart';
import 'exercise_detail_screen.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  @override
  _ExerciseLibraryScreenState createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  List<Exercise> _exercises = [];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final db = await DatabaseHelper.instance.getExercises();
    setState(() {
      _exercises = db;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _exercises
        .where((e) =>
            e.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("📚 مكتبة التمارين")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "ابحث عن تمرين...",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final ex = filtered[index];
                return Card(
                  child: ListTile(
                    title: Text(ex.name),
                    subtitle: Text(ex.description),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDetailScreen(exercise: ex),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
