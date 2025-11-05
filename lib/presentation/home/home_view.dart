import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/presentation/home/controller/home_controller.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TETRIS',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 32),
            Obx(
              () => Text(
                'High Score: ${controller.highScore}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: controller.onStartGame,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 16,
                ),
              ),
              child: const Text('START GAME', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: controller.onOpenSettings,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 16,
                ),
              ),
              child: const Text('SETTINGS', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
