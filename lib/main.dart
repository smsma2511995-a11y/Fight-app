import 'package:flutter/material.dart';
import 'data/database_helper.dart';
import 'data/martial_exercises.dart'; // ✅ هنا كل التمارين
import 'models/exercise_model.dart';
import 'screens/dashboard_screen.dart'; // ✅ تبدأ من داشبورد

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();

  // ✅ أدخل التمارين كلها في قاعدة البيانات مرة واحدة
  for (var ex in allExercises) {
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: DashboardScreen(), // ✅ بدل ExercisesScreen
    );
  }
}
