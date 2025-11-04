import 'package:get/get.dart';
import 'package:tetris_game/presentation/controller/home_controller.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(() => HomeViewController());
  }
}