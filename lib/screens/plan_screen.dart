import 'package:flutter/material.dart';
import '../services/plan_manager.dart';
import '../models/exercise_model.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final PlanManager _planManager = PlanManager();
  late List<List<Exercise>> _weeklyPlan;

  @override
  void initState() {
    super.initState();
    _generatePlan();
  }

  void _generatePlan() {
    setState(() {
      _weeklyPlan = _planManager.generateWeeklyPlan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("📅 خطتي التدريبية"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _weeklyPlan.length,
        itemBuilder: (context, index) {
          final dayExercises = _weeklyPlan[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اليوم ${index + 1}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                  const SizedBox(height: 8),
                  ...dayExercises.map((exercise) => Row(
                        children: [
                          const Icon(Icons.fitness_center,
                              color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              exercise.nameAr,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generatePlan,
        label: const Text("تجديد الخطة"),
        icon: const Icon(Icons.refresh),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
