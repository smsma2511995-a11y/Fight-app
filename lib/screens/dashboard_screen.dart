import 'package:flutter/material.dart';

// --- هذا هو الإصلاح: تم استخدام ":" بدلاً من "." ---
import 'package:fight_app/widgets/app_drawer.dart';
import 'package:fight_app/widgets/section_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: SectionCard(
          title: 'Exercises',
          icon: Icons.fitness_center,
          onTap: null,
        ),
      ),
    );
  }
}
