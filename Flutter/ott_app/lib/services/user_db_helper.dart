import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class UserDbHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL UNIQUE,
            fullname TEXT NOT NULL,
            password TEXT NOT NULL
          );
        ''');
      },
    );
  }

  Future<void> insertInitialUsers(List<User> users) async {
    final dbClient = await db;
    final count = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM users'),
    );
    if (count == 0) {
      for (final user in users) {
        await dbClient.insert('users', user.toMap());
      }
    }
  }

  Future<User?> getUser(String username, String password) async {
    final dbClient = await db;
    final maps = await dbClient.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<void> addUser(User user) async {
    final dbClient = await db;
    await dbClient.insert('users', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final dbClient = await db;
    final maps = await dbClient.query('users');
    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }
}