import 'package:flutter/material.dart';

// --- تم الإصلاح هنا ---
// تم التأكد من أن مسارات الاستيراد صحيحة.
// الرجاء التأكد من أن أسماء الملفات في مجلد 'widgets' مطابقة لهذه الأسماء تمامًا.
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
      
      // --- تم الإصلاح هنا ---
      // تم حذف 'const' لتجنب الأخطاء
      drawer: AppDrawer(),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          SectionCard(
            title: 'تمارين',
            icon: Icons.fitness_center,
            onTap: () {
              // Navigate to exercises screen
            },
          ),
          SectionCard(
            title: 'خطط التغذية',
            icon: Icons.restaurant_menu,
            onTap: () {
              // Navigate to diet plans screen
            },
          ),
          SectionCard(
            title: 'المدرب الذكي',
            icon: Icons.lightbulb_outline,
            onTap: () {
              // Navigate to smart coach screen
            },
          ),
          SectionCard(
            title: 'تتبع التقدم',
            icon: Icons.show_chart,
            onTap: () {
              // Navigate to progress tracking screen
            },
          ),
        ],
      ),
    );
  }
}
