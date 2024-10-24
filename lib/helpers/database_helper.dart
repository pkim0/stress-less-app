import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  // Database instance
  static Database? _database;

  DatabaseHelper._internal();

  // Get or create the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    // Get the database path
    String path = join(await getDatabasesPath(), 'user_database.db');

    // Open the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the users table
        await db.execute(
          '''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            password TEXT NOT NULL
          )
          '''
        );
      },
    );
  }

  // Register a new user
  Future<int> registerUser(String username, String password) async {
    final db = await database;
    return await db.insert(
      'users',
      {'username': username, 'password': password},
    );
  }

  // Login an existing user
  Future<Map<String, dynamic>?> loginUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return results.isNotEmpty ? results.first : null;
  }
}
