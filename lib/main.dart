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
