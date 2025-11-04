import 'package:get/get.dart';
import 'package:tetris_game/presentation/bindings/home_bindings.dart';
import 'package:tetris_game/presentation/home/home_view.dart';
import 'package:tetris_game/presentation/tetris/bindings/game_view_binding.dart';
import 'package:tetris_game/presentation/tetris/view/game_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.gameView,
      page: () => const GameView(),
      binding: GameViewBinding(),
    ),
     GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
  ];
}
