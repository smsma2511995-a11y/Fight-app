import 'package:flutter/material.dart'; import 'package:flutter/services.dart'; import 'data/database_helper.dart'; import 'data/martial_exercises.dart'; // ✅ كل التمارين موجودة هنا import 'models/exercise_model.dart';

void main() async { WidgetsFlutterBinding.ensureInitialized(); final dbHelper = DatabaseHelper();

// ✅ إضافة كل التمارين مرة واحدة عند التشغيل for (var ex in allExercises) { await dbHelper.insertExercise(ex); }

runApp(const FightApp()); }

class FightApp extends StatelessWidget { const FightApp({super.key});

@override Widget build(BuildContext context) { final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF0EA5E9)); return MaterialApp( debugShowCheckedModeBanner: false, title: 'تطبيق القتال', theme: ThemeData( useMaterial3: true, colorScheme: colorScheme, scaffoldBackgroundColor: const Color(0xFFF8FAFC), ), home: const HomeScreen(), ); } }

class HomeScreen extends StatefulWidget { const HomeScreen({super.key});

@override State<HomeScreen> createState() => _HomeScreenState(); }

class _HomeScreenState extends State<HomeScreen> { final dbHelper = DatabaseHelper(); List<Exercise> todaysPlan = []; double todayProgress = 0.0;

@override void initState() { super.initState(); _loadTodaysPlan(); }

Future<void> _loadTodaysPlan() async { final all = await dbHelper.getAllExercises(); setState(() { todaysPlan = all; todayProgress = 0.0; // تقدر تحسب التقدّم حسب الحاجة لاحقًا }); }

@override Widget build(BuildContext context) { return SafeArea( child: ListView( padding: const EdgeInsets.all(16), children: [ _HeaderCard(progress: todayProgress, onStartTap: _openQuickStart), const SizedBox(height: 16), const _SectionTitle(title: 'خطة اليوم'), const SizedBox(height: 8), _TodayPlanList(items: todaysPlan), const SizedBox(height: 16), _SectionTitle(title: 'إجراءات سريعة'), const SizedBox(height: 8), const _QuickActions(), ], ), ); }

void _openQuickStart() { showModalBottomSheet( context: context, isScrollControlled: true, shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(24)), ), builder: (ctx) => const _QuickStartSheet(), ); } }

// هنا تقدر تستخدم نفس باقي الكلاسات UI من الكود السابق (_HeaderCard, _SectionTitle, _TodayPlanList, _QuickActions, _QuickStartSheet) // لكن في _TodayPlanList استبدل الـ Map ب Exercise مباشرة class _TodayPlanList extends StatelessWidget { final List<Exercise> items; const _TodayPlanList({required this.items});

@override Widget build(BuildContext context) { return Card( child: ListView.separated( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), padding: const EdgeInsets.symmetric(vertical: 8), itemBuilder: (ctx, i) { final it = items[i]; return ListTile( leading: CircleAvatar( radius: 22, backgroundColor: Theme.of(context).colorScheme.primaryContainer, child: const Icon(Icons.sports_mma_outlined), ), title: Text(it.name), subtitle: Text(it.type), trailing: Text(it.value, style: const TextStyle(fontWeight: FontWeight.w700)), ); }, separatorBuilder: (_, __) => const Divider(height: 1), itemCount: items.length, ), ); } }

