import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../data/martial_exercises.dart';

class PlanScreen extends StatefulWidget {
  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final Map<int, List<Exercise>> _plan = {}; // اليوم -> التمارين

  @override
  void initState() {
    super.initState();
    _generatePlan();
  }

  void _generatePlan() {
    _plan.clear();
    final allExercises = allExercisesList; // من martial_exercises.dart
    int day = 1;

    for (int i = 0; i < allExercises.length; i += 3) {
      _plan[day] = allExercises.sublist(
        i,
        i + 3 > allExercises.length ? allExercises.length : i + 3,
      );
      day++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("خطة التمارين"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _generatePlan();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _plan.length,
        itemBuilder: (context, index) {
          final day = index + 1;
          final exercises = _plan[day]!;

          return Card(
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              title: Text("اليوم $day"),
              children: exercises
                  .map(
                    (ex) => ListTile(
                      leading: Icon(Icons.fitness_center, color: Colors.deepPurple),
                      title: Text(ex.name),
                      subtitle: Text(ex.description, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
