import 'package:flutter/material.dart';

// استيراد قائمة التمارين التي جهزناها
import 'package:fight_app/data/exercises_seed.dart';
// استيراد "بطاقة التعريف" الخاصة بالتمرين
import 'package:fight_app/models/exercise_model.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة التمارين'),
      ),
      body: ListView.builder(
        // عدد العناصر في القائمة هو نفس عدد التمارين في قائمتنا
        itemCount: allExercises.length,
        // builder هو الذي يقوم ببناء كل عنصر في القائمة
        itemBuilder: (BuildContext context, int index) {
          // الحصول على التمرين الحالي من القائمة
          final MartialArtsExercise exercise = allExercises[index];

          // استخدام ListTile لعرض كل تمرين بشكل جميل
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              // الأيقونة على اليسار
              leading: Icon(Icons.fitness_center, color: Colors.red[700]),
              // عنوان التمرين
              title: Text(
                exercise.nameAr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // معلومات إضافية تحت العنوان
              subtitle: Text('${exercise.category} - ${exercise.difficulty}'),
              // أيقونة السهم على اليمين
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // هنا سنضيف لاحقًا الكود لعرض تفاصيل التمرين
                print('Tapped on: ${exercise.nameAr}');
              },
            ),
          );
        },
      ),
    );
  }
}
