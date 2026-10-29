// lib/services/movies_db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/movies.dart';

class MoviesDbHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'movies.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE arss_video (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            CastId INTEGER NOT NULL,
            MovieId INTEGER NOT NULL,
            MovieName TEXT NOT NULL,
            MovieLength TEXT NOT NULL,
            Category TEXT NOT NULL,
            SubCategory TEXT NOT NULL,
            ImageVertical TEXT NOT NULL,
            ImageHorizontal TEXT NOT NULL,
            youtubelink TEXT NOT NULL,
            RealeaseDate TEXT NOT NULL,
            Price INTEGER NOT NULL,
            Description TEXT NOT NULL
          );
        ''');
      },
    );
  }

  Future<void> insertmovies(List<MoviesItem> movies) async {
    final dbClient = await db;
    final count = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM arss_video'),
    );
    if (count == 0) {
      for (final movie in movies) {
        await dbClient.insert('arss_video', movie.toMap());
      }
    }
  }

  Future<List<MoviesItem>> getMovies() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('arss_video');
    return List.generate(maps.length, (i) => MoviesItem.fromMap(maps[i]));
  }
}