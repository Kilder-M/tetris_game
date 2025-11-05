import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tetris_game/core/constants/sqlite_scripts_constants.dart';

class SqliteDatabaseService {
  
  Future<Database> getSqliteDatabase() async {
    String path = join(await getDatabasesPath(), 'tetris_game');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(createScoreTable);
      },
    );
    return db;
  }
}
