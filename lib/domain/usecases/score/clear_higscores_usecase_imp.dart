import 'package:tetris_game/domain/repositories/score/score_repository.dart';
import 'package:tetris_game/domain/usecases/score/clear_higscores_usecase.dart';

class ClearScoresUseCaseImp implements ClearScoresUseCase {
  final ScoreRepository repository;

  ClearScoresUseCaseImp(this.repository);

  @override
  Future<void> call() async {
    await repository.clearScores();
  }
}
