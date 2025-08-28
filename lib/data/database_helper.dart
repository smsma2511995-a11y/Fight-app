import 'package.sqflite/sqflite.dart';
import 'package.path/path.dart';

class DatabaseHelper {
  // استخدام Singleton pattern لضمان وجود نسخة واحدة فقط من قاعدة البيانات
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'workout_history.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // عند إنشاء قاعدة البيانات لأول مرة، قم بإنشاء جدول لتاريخ التمارين
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workout_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        exerciseId INTEGER NOT NULL,
        exerciseName TEXT NOT NULL,
        duration INTEGER NOT NULL,
        calories INTEGER NOT NULL,
        completedAt TEXT NOT NULL
      )
    ''');
  }

  // إضافة سجل تمرين جديد إلى قاعدة البيانات
  Future<void> logExercise(int exerciseId, String exerciseName, int duration, int calories) async {
    final db = await database;
    await db.insert(
      'workout_history',
      {
        'exerciseId': exerciseId,
        'exerciseName': exerciseName,
        'duration': duration,
        'calories': calories,
        'completedAt': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // الحصول على إجمالي عدد التمارين المكتملة
  Future<int> getTotalCompletedExercises() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM workout_history');
    return Sqflite.firstIntValue(result) ?? 0;
  }
  
  // الحصول على إجمالي السعرات الحرارية المحروقة
  Future<int> getTotalCaloriesBurned() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(calories) FROM workout_history');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}
