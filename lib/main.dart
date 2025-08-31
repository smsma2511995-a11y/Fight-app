import 'package:flutter/material.dart';

// --- هذا هو الإصلاح: تم استخدام ":" بدلاً من "." ---
import 'package:fight_app/screens/dashboard_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fight App',
      home: const DashboardScreen(),
    );
  }
}
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Exercise>> loadExercises() async {
  final data = await rootBundle.loadString('assets/data/exercises.json');
  final List<dynamic> jsonResult = json.decode(data);
  return jsonResult.map((e) => Exercise.fromJson(e)).toList();
}
