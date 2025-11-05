import 'package:get/get.dart';
import 'package:tetris_game/data/data_sources/local/score_sqlite_data_source_imp.dart';
import 'package:tetris_game/data/data_sources/score/score_data_source.dart';
import 'package:tetris_game/data/repositories/score/score_repository_imp.dart';
import 'package:tetris_game/data/services/sqlite_database_service.dart';
import 'package:tetris_game/domain/repositories/score/score_repository.dart';
import 'package:tetris_game/domain/usecases/score/clear_higscores_usecase.dart';
import 'package:tetris_game/domain/usecases/score/clear_higscores_usecase_imp.dart';
import 'package:tetris_game/domain/usecases/score/get_highscores_usecase.dart';
import 'package:tetris_game/domain/usecases/score/get_highscores_usecase_imp.dart';
import 'package:tetris_game/domain/usecases/score/save_highscore_usecase.dart';
import 'package:tetris_game/domain/usecases/score/save_highscore_usecase_imp.dart';
import 'package:tetris_game/presentation/tetris/controller/tetris_view_controller.dart';

class TetrisViewBindings extends Bindings {
  @override
  void dependencies() {
    
    //Database
    Get.lazyPut<SqliteDatabaseService>(() => SqliteDatabaseService());

    //Controllers
    Get.lazyPut<TetrisViewController>(() => TetrisViewController());

    //Data Sources
    Get.lazyPut<ScoreDataSource>(
      () => ScoreSqliteDataSourceImp(Get.find()),
    );

    //Repositories
    Get.lazyPut<ScoreRepository>(() => ScoreRepositoryImpl(Get.find()));

    //Usecases
    Get.lazyPut<GetHighScoresUseCase>(
      () => GetHighScoresUseCaseImp(Get.find()),
    );
    Get.lazyPut<SaveScoreUseCase>(() => SaveScoreUseCaseImp(Get.find()));
    Get.lazyPut<ClearScoresUseCase>(() => ClearScoresUseCaseImp(Get.find()));
  }
}
