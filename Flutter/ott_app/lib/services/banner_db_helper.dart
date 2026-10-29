import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/banner_item.dart';

class BannerDBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'banners.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE arss_slider (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            slider TEXT NOT NULL,
            DateTime TEXT NOT NULL,
            base64 TEXT NOT NULL
          );
        ''');
      },
    );
  }

  Future<void> insertInitialBanners(List<BannerItem> banners) async {
    final dbClient = await db;
    final count = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM arss_slider'),
    );
    if (count == 0) {
      for (final banner in banners) {
        await dbClient.insert('arss_slider', banner.toMap());
      }
    }
  }

  Future<List<BannerItem>> getBanners() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('arss_slider');
    return List.generate(maps.length, (i) => BannerItem.fromMap(maps[i]));
  }
}
