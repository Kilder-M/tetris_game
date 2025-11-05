import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/domain/repositories/score/score_repository.dart';
import 'package:tetris_game/domain/usecases/score/get_highscores_usecase.dart';

class GetHighScoresUseCaseImp implements GetHighScoresUseCase {
  final ScoreRepository repository;

  GetHighScoresUseCaseImp(this.repository);

  @override
  Future<List<Score>?> call() async {
    return await repository.getHighScores();
  }
}
