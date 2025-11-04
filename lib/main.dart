import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/core/routes/app_pages.dart';

void main() {
  runApp(const TetrisApp());
}

class TetrisApp extends StatelessWidget {
  const TetrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
