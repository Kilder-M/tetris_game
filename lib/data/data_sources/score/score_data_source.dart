import 'package:tetris_game/data/dtos/score_dto.dart';

abstract class ScoreDataSource {
  Future<int> saveScore(ScoreDto score);
  Future<List<ScoreDto>?> getHighScores();
  Future<void> clearScores();
}