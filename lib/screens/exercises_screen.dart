import 'package:flutter/material.dart';

import 'package:fight_app/data/exercises_seed.dart';
import 'package:fight_app/models/exercise_model.dart';
// استيراد الشاشة الجديدة التي أنشأناها للتو
import 'package:fight_app/screens/exercise_detail_screen.dart'; 

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة التمارين'),
      ),
      body: ListView.builder(
        itemCount: allExercises.length,
        itemBuilder: (BuildContext context, int index) {
          final MartialArtsExercise exercise = allExercises[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: Colors.red[700]),
              title: Text(
                exercise.nameAr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${exercise.category} - ${exercise.difficulty}'),
              trailing: const Icon(Icons.arrow_forward_ios),

              // --- هذا هو التعديل الوحيد ---
              // الآن عند الضغط، سينتقل المستخدم إلى شاشة التفاصيل
              // وسيرسل معه بيانات التمرين الذي تم الضغط عليه
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailScreen(exercise: exercise),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
