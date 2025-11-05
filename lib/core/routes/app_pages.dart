import 'package:get/get.dart';
import 'package:tetris_game/presentation/home/bindings/home_bindings.dart';
import 'package:tetris_game/presentation/home/home_view.dart';
import 'package:tetris_game/presentation/tetris/bindings/tetris_view_binding.dart';
import 'package:tetris_game/presentation/tetris/view/tetris_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.gameView,
      page: () => const TetrisView(),
      binding: TetrisViewBindings(),
    ),
     GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
  ];
}
