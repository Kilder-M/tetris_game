import 'package:get/get.dart';

class HomeViewController extends GetxController {
  final RxInt highScore = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadHighScore();
  }

  void loadHighScore() {}

  void onStartGame() {
    Get.toNamed('/game_view');
  }

  void onOpenSettings() {
    Get.toNamed('/settings');
  }
}
