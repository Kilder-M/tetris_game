import 'package:get/get.dart';
import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/domain/usecases/score/get_highscores_usecase.dart';

class HomeViewController extends GetxController {
  final GetHighScoresUseCase getHighScoresUseCase =
      Get.find<GetHighScoresUseCase>();
  final RxInt highScore = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadHighScore();
  }

  //get highscore from storage
  void loadHighScore() async {
    List<Score>? scores = await getHighScoresUseCase.call();
    if (scores != null && scores.isNotEmpty) {
      highScore.value = scores.first.points;
    }
  }

  void onStartGame() {
    // Navigate to game view and refresh high score on return
    Get.toNamed('/game_view')?.then((_) => loadHighScore());
  }

  void onOpenSettings() {
    Get.toNamed('/settings');
  }

  void onOpenHighScores() {
    Get.toNamed('/highscores');
  }
}
