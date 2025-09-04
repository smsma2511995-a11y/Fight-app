import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _db;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'exercises.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        videoUrl TEXT,
        localPath TEXT
      )
    ''');
  }

  Future<int> insertExercise(Exercise exercise) async {
    final database = await db;
    return await database.insert('exercises', exercise.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Exercise>> getExercises() async {
    final database = await db;
    final List<Map<String, dynamic>> maps = await database.query('exercises');
    return List.generate(maps.length, (i) => Exercise.fromMap(maps[i]));
  }

  Future<void> updateExercise(Exercise exercise) async {
    final database = await db;
    await database.update(
      'exercises',
      exercise.toMap(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }
}
