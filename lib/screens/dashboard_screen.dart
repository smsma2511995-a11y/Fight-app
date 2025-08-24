import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:integrated_martial_arts_trainer/screens/exercise_library_screen.dart';
import 'package:integrated_martial_arts_trainer/screens/progress_screen.dart';
import 'package:integrated_martial_arts_trainer/screens/workout_player_screen.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً بعودتك، يا بطل!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            // Today's Workout Card
            _buildTodaysWorkoutCard(context),

            const SizedBox(height: 24),
            
            // Weekly Progress
            _buildWeeklyProgressCard(context),
            
            const SizedBox(height: 24),
            Text(
              'أدواتك التدريبية',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            
            // Quick Navigation Cards
            SectionCard(
              icon: Icons.local_library,
              title: 'مكتبة التمارين',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExerciseLibraryScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            SectionCard(
              icon: Icons.bar_chart,
              title: 'تتبع التقدم',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProgressScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaysWorkoutCard(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: InkWell(
        onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WorkoutPlayerScreen()),
           );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تمرين اليوم',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'المرحلة 1: أساسيات الكاراتيه والقوة',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.timer_outlined),
                  const SizedBox(width: 8),
                  const Text('60 دقيقة'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyProgressCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تقدمك الأسبوعي',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'أكملت 3 من 5 تمارين. استمر!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 8.0,
              percent: 0.6,
              center: const Text("60%", style: TextStyle(fontWeight: FontWeight.bold)),
              progressColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
