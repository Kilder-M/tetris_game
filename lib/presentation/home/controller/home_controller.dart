import 'package:get/get.dart';
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

  // Load the highest score from storage
  Future<void> loadHighScore() async {
    final scores = await getHighScoresUseCase.call();
    if (scores != null && scores.isNotEmpty) {
      highScore.value = scores.first.points;
    } else {
      highScore.value = 0; // Reset if list empty
    }
  }

  void onStartGame() {
    // Navigate to game view and refresh high score when user returns
    Get.toNamed('/game_view')!.then((_) => loadHighScore());
  }

  void onOpenSettings() {
    Get.toNamed('/settings');
  }

  Future<void> onOpenHighScores() async {
    // Wait for HighScoreView to close, then refresh
    await Get.toNamed('/highscores');
    await loadHighScore();
  }
}
