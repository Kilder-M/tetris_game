import 'package:tetris_game/data/data_sources/score/score_data_source.dart';
import 'package:tetris_game/data/dtos/score_dto.dart';
import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/domain/repositories/score/score_repository.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final ScoreDataSource localDataSource;

  ScoreRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveScore(Score score) async {
    final dto = ScoreDto.fromEntity(score);
    await localDataSource.saveScore(dto);
  }

  @override
  Future<List<Score>?> getHighScores() async {
    final list = await localDataSource.getHighScores();
    return  list?.map((scoresDto) => scoresDto.toEntity()).toList();
  }

  @override
  Future<void> clearScores() async {
    await localDataSource.clearScores();
  }
}
