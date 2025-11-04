import 'package:get/get.dart';

class HomeViewController extends GetxController {
  final RxInt highScore = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // TODO: Load high score from storage
    loadHighScore();
  }

  void loadHighScore() {
    // TODO: Implement loading high score from local storage
  }

  void onStartGame() {
    Get.toNamed('/game_view');
  }

  void onOpenSettings() {
    // TODO: Implement settings navigation
    Get.toNamed('/settings');
  }
}