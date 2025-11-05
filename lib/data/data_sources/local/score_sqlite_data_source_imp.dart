import 'package:tetris_game/data/data_sources/score/score_data_source.dart';
import 'package:tetris_game/data/dtos/score_dto.dart';
import 'package:tetris_game/data/services/sqlite_database_service.dart';

class ScoreSqliteDataSourceImp implements ScoreDataSource {
  final SqliteDatabaseService sqliteDatabaseService;

  ScoreSqliteDataSourceImp(this.sqliteDatabaseService);

  Future<int> insertScore(ScoreDto dto) async {
    final db = await sqliteDatabaseService.getSqliteDatabase();
    return await db.insert('scores', dto.toMap());
  }

  @override
  Future<void> clearScores() async {
    final db = await sqliteDatabaseService.getSqliteDatabase();
    await db.delete('scores');
  }

  @override
  Future<List<ScoreDto>?> getHighScores() async {
    final db = await sqliteDatabaseService.getSqliteDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'scores',
      orderBy: 'points DESC',
    );
    return maps.map((e) => ScoreDto.fromMap(e)).toList();
  }

  @override
  Future<int> saveScore(ScoreDto dto) async {
    final db = await sqliteDatabaseService.getSqliteDatabase();
    return await db.insert('scores', dto.toMap());
  }
}
