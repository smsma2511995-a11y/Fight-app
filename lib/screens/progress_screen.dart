import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fight_app/data/database_helper.dart'; // استيراد قاعدة البيانات

// سنقوم بإنشاء نموذج بسيط للإنجازات
class Achievement {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool Function(int) isUnlocked; // دالة للتحقق مما إذا كان الإنجاز مفتوحًا

  Achievement({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isUnlocked,
  });
}

// قائمة الإنجازات
final List<Achievement> achievements = [
  Achievement(icon: Icons.local_fire_department, title: 'بداية قوية', subtitle: 'أكمل أول تمرين لك', isUnlocked: (count) => count >= 1),
  Achievement(icon: Icons.star, title: 'المثابر', subtitle: 'أكمل 10 تمارين', isUnlocked: (count) => count >= 10),
  Achievement(icon: Icons.timer, title: 'مدمن تمارين', subtitle: 'أكمل 50 تمرينًا', isUnlocked: (count) => count >= 50),
  Achievement(icon: Icons.fitness_center, title: 'وحش التدريب', subtitle: 'أكمل 100 تمرين', isUnlocked: (count) => count >= 100),
  // يمكنك إضافة المزيد من الإنجازات هنا
];

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  // استخدام FutureBuilder لتحميل البيانات ديناميكيًا
  late Future<Map<String, int>> _statsFuture;

  @override
  void initState() {
    super.initState();
    _statsFuture = _loadStats();
  }

  Future<Map<String, int>> _loadStats() async {
    final dbHelper = DatabaseHelper();
    final totalExercises = await dbHelper.getTotalCompletedExercises();
    final totalCalories = await dbHelper.getTotalCaloriesBurned();
    // يمكنك إضافة المزيد من الإحصائيات هنا (مثل سلسلة الأيام)
    return {
      'totalExercises': totalExercises,
      'totalCalories': totalCalories,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تتبع التقدم'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'الإحصائيات', icon: Icon(Icons.analytics)),
                Tab(text: 'الإنجازات', icon: Icon(Icons.emoji_events)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildStatsTab(context),
                  _buildAchievementsTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- تبويب الإحصائيات (موصول بقاعدة البيانات) ---
  Widget _buildStatsTab(BuildContext context) {
    return FutureBuilder<Map<String, int>>(
      future: _statsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('حدث خطأ في تحميل البيانات'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد بيانات لعرضها. ابدأ التدريب!'));
        }

        final stats = snapshot.data!;
        final totalExercises = stats['totalExercises'] ?? 0;
        final totalCalories = stats['totalCalories'] ?? 0;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard('إجمالي التمارين', totalExercises.toString(), Icons.fitness_center, context),
                  _buildStatCard('إجمالي السعرات', totalCalories.toString(), Icons.local_fire_department, context),
                ],
              ),
              const SizedBox(height: 24),
              Text('التمارين المكتملة هذا الأسبوع', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    // بيانات الرسم البياني لا تزال ثابتة، يمكن ربطها بقاعدة البيانات لاحقًا
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: [
                      _makeBarData(0, 5), _makeBarData(1, 8), _makeBarData(2, 6),
                      _makeBarData(3, 4), _makeBarData(4, 7), _makeBarData(5, 0),
                      _makeBarData(6, 0),
                    ],
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: _bottomTitles)),
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- تبويب الإنجازات (موصول بقاعدة البيانات) ---
  Widget _buildAchievementsTab(BuildContext context) {
    return FutureBuilder<Map<String, int>>(
      future: _statsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final totalExercises = snapshot.data!['totalExercises'] ?? 0;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          padding: const EdgeInsets.all(16),
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            final achievement = achievements[index];
            final isUnlocked = achievement.isUnlocked(totalExercises);
            return _buildAchievement(achievement.icon, achievement.title, isUnlocked, context);
          },
        );
      },
    );
  }

  // --- دوال مساعدة للواجهة (من تصميمك) ---
  Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0: text = 'س'; break;
      case 1: text = 'ح'; break;
      case 2: text = 'ن'; break;
      case 3: text = 'ث'; break;
      case 4: text = 'ر'; break;
      case 5: text = 'خ'; break;
      case 6: text = 'ج'; break;
      default: text = ''; break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
  }

  BarChartGroupData _makeBarData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: Theme.of(context).colorScheme.primary, width: 15, borderRadius: BorderRadius.circular(4))]);
  }

  Widget _buildStatCard(String title, String value, IconData icon, BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 8),
              Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              Text(title, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievement(IconData icon, String title, bool isUnlocked, BuildContext context) {
    return Card(
      color: isUnlocked ? Theme.of(context).colorScheme.primaryContainer : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: isUnlocked ? Theme.of(context).colorScheme.primary : Colors.grey),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: isUnlocked ? Theme.of(context).colorScheme.primary : Colors.grey)),
        ],
      ),
    );
  }
}
