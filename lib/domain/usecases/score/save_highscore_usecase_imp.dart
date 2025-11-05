import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/domain/repositories/score/score_repository.dart';
import 'package:tetris_game/domain/usecases/score/save_highscore_usecase.dart';

class SaveScoreUseCaseImp implements SaveScoreUseCase {
  final ScoreRepository repository;

  SaveScoreUseCaseImp(this.repository);

  @override
  Future<void> call(Score score) async {
    await repository.saveScore(score);
  }
}
