import 'package:get/get.dart';
import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/domain/usecases/score/clear_higscores_usecase.dart';
import 'package:tetris_game/domain/usecases/score/get_highscores_usecase.dart';

class HighScoresController extends GetxController {
  final GetHighScoresUseCase getHighScoresUseCase = Get.find<GetHighScoresUseCase>();
  final ClearScoresUseCase clearScoresUseCase = Get.find<ClearScoresUseCase>();

  RxList<Score> scores = <Score>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadScores();
  }

  void loadScores() async {
    final loaded = await getHighScoresUseCase.call();
    if (loaded != null) {
      scores.value = loaded;
    }
  }

  void clearHighScores() async {
    await clearScoresUseCase.call();
    scores.clear();
  }
}
