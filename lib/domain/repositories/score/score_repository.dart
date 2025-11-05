import 'package:tetris_game/domain/entities/score.dart';

abstract class ScoreRepository {
  Future<void> saveScore(Score score);
  Future<List<Score>?> getHighScores();
  Future<void> clearScores();
}
