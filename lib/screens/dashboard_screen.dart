import 'package:flutter/material.dart';
import 'package:integrated_martial_arts_trainer/widgets/app_drawer.dart';
import 'package:integrated_martial_arts_trainer/widgets/section_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionCard(
              title: "التمارين الأساسية",
              icon: Icons.fitness_center,
              onTap: () {
                // التنقل إلى شاشة التمارين
              },
            ),
            const SizedBox(height: 16),
            SectionCard(
              title: "الإحصائيات",
              icon: Icons.bar_chart,
              onTap: () {
                // التنقل إلى شاشة الإحصائيات
              },
            ),
            const SizedBox(height: 16),
            SectionCard(
              title: "الملف الشخصي",
              icon: Icons.person,
              onTap: () {
                // التنقل إلى الملف الشخصي
              },
            ),
            const SizedBox(height: 16),
            SectionCard(
              title: "الإعدادات",
              icon: Icons.settings,
              onTap: () {
                // التنقل إلى الإعدادات
              },
            ),
          ],
        ),
      ),
    );
  }
}
