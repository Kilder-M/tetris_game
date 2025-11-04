import 'package:get/get.dart';
import 'package:tetris_game/presentation/tetris/controller/tetris_view_controller.dart';

class GameViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TetrisViewController>(() => TetrisViewController());
  }
}