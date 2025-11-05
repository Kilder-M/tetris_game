import 'package:tetris_game/domain/entities/score.dart';

abstract class GetHighScoresUseCase {
  Future<List<Score>?> call();
}
