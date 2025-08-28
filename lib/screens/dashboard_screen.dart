// --- تم التأكد من وجود كل أسطر import الضرورية ---
import 'package:flutter/material.dart'; // <--- السطر الأهم

// تأكد من أن هذه الملفات موجودة في مشروعك بالأسماء الصحيحة
import 'package:fight_app/widgets/app_drawer.dart';
import 'package:fight_app/widgets/section_card.dart';
import 'package:fight_app/screens/exercises_screen.dart';
import 'package:fight_app/screens/progress_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fight_app'),
        centerTitle: true,
      ),
      
      drawer: const AppDrawer(),

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExercisesScreen()),
              );
            },
          ),
          SectionCard(
            title: 'خطط التغذية',
            icon: Icons.restaurant_menu,
            onTap: () {
              // سيتم بناء هذه الشاشة لاحقًا
              print("Diet card tapped");
            },
          ),
          SectionCard(
            title: 'المدرب الذكي',
            icon: Icons.lightbulb_outline,
            onTap: () {
              // سيتم بناء هذه الشاشة لاحقًا
              print("Coach card tapped");
            },
          ),
          SectionCard(
            title: 'تتبع التقدم',
            icon: Icons.show_chart,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProgressScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
