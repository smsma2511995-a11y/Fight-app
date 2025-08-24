import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

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

  Widget _buildStatsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Key Metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard('إجمالي الساعات', '25', Icons.timer, context),
              _buildStatCard('سلسلة الأيام', '7', Icons.local_fire_department, context),
            ],
          ),
          const SizedBox(height: 24),
          // Chart
          Text('التمارين المكتملة هذا الأسبوع', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: [
                  _makeBarData(0, 5, color: Colors.red), // Sat
                  _makeBarData(1, 8, color: Colors.orange), // Sun
                  _makeBarData(2, 6, color: Colors.yellow), // Mon
                  _makeBarData(3, 4, color: Colors.green), // Tue
                  _makeBarData(4, 7, color: Colors.blue), // Wed
                  _makeBarData(5, 0, color: Colors.indigo), // Thu
                  _makeBarData(6, 0, color: Colors.purple), // Fri
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
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
                      },
                    ),
                  ),
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
  }

  BarChartGroupData _makeBarData(int x, double y, {required Color color}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
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

  Widget _buildAchievementsTab(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16),
      children: [
        _buildAchievement(Icons.local_fire_department, 'بداية قوية', 'أكمل أول تمرين لك', true, context),
        _buildAchievement(Icons.star, 'المؤسس', 'أكمل المرحلة التأسيسية', true, context),
        _buildAchievement(Icons.timer, 'مدمن تمارين', 'أكمل 50 تمرينًا', true, context),
        _buildAchievement(Icons.fitness_center, 'وحش الكارديو', 'أكمل شهر التحمل', false, context),
        _buildAchievement(Icons.wb_sunny, 'التزام يومي', 'تمرن 7 أيام متتالية', true, context),
        _buildAchievement(Icons.nightlight_round, 'بومة الليل', 'أكمل تمرينًا بعد منتصف الليل', false, context),
      ],
    );
  }

  Widget _buildAchievement(IconData icon, String title, String subtitle, bool isUnlocked, BuildContext context) {
    return Card(
      color: isUnlocked ? Theme.of(context).colorScheme.primaryContainer : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: isUnlocked ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: isUnlocked ? Theme.of(context).colorScheme.primary : Colors.grey),
          ),
        ],
      ),
    );
  }
}
