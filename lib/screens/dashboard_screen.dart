import 'package:flutter/material.dart';

// تم التأكد من أن هذه المسارات صحيحة بناءً على هيكل مشروعك الناجح
import 'package:fight_app/widgets/app_drawer.dart';
import 'package:fight_app/widgets/section_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // تم تغيير العنوان ليعكس اسم التطبيق
        title: const Text('سَتُورِي'),
        centerTitle: true, // لوضع العنوان في المنتصف
      ),
      
      // القائمة الجانبية كما هي
      drawer: const AppDrawer(),

      // --- هذا هو التعديل الرئيسي ---
      // استخدمنا GridView لعرض 4 أقسام بشكل جميل
      body: GridView.count(
        crossAxisCount: 2, // عمودان في الشبكة
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          SectionCard(
            title: 'تمارين',
            icon: Icons.fitness_center,
            onTap: () {
              // هنا سنضيف لاحقًا الكود للانتقال إلى شاشة التمارين
              print("Exercises card tapped");
            },
          ),
          SectionCard(
            title: 'خطط التغذية',
            icon: Icons.restaurant_menu,
            onTap: () {
              print("Diet card tapped");
            },
          ),
          SectionCard(
            title: 'المدرب الذكي',
            icon: Icons.lightbulb_outline,
            onTap: () {
              print("Coach card tapped");
            },
          ),
          SectionCard(
            title: 'تتبع التقدم',
            icon: Icons.show_chart,
            onTap: () {
              print("Progress card tapped");
            },
          ),
        ],
      ),
    );
  }
}
