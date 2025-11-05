import 'package:tetris_game/data/data_sources/score/score_data_source.dart';
import 'package:tetris_game/data/dtos/score_dto.dart';

class ScoreApiDataSourceImp implements ScoreDataSource {
  final String client;
  ScoreApiDataSourceImp(this.client);

  @override
  Future<void> clearScores() {
    //cliente.clear scores via api
    throw UnimplementedError();
  }

  @override
  Future<List<ScoreDto>?> getHighScores() {
    // cliete.get high scores via api
    throw UnimplementedError();
  }

  @override
  Future<int> saveScore(ScoreDto score) {
    // cleinte.save score via api
    throw UnimplementedError();
  }

 
}