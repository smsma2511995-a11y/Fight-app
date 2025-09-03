import 'package:flutter/material.dart';
import 'plan_screen.dart';
import 'workout_screen.dart';
import 'exercise_detail_screen.dart';
import 'exercise_library_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق التمارين',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/plan': (context) => PlanScreen(),
        '/workout': (context) => WorkoutScreen(),
        '/exerciseDetail': (context) => ExerciseDetailScreen(),
        '/library': (context) => ExerciseLibraryScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🏋️ تطبيق التمارين"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("📅 خطة التدريب"),
              onPressed: () => Navigator.pushNamed(context, '/plan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("🔥 تمرين اليوم"),
              onPressed: () => Navigator.pushNamed(context, '/workout'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("📚 مكتبة التمارين"),
              onPressed: () => Navigator.pushNamed(context, '/library'),
            ),
          ],
        ),
      ),
    );
  }
}
