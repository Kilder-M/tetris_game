import 'package:tetris_game/domain/entities/score.dart';

abstract class SaveScoreUseCase {
  Future<void> call(Score score);
}
