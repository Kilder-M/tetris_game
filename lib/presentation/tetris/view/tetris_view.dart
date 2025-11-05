import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/presentation/Widgets/board_widget.dart';
import 'package:tetris_game/presentation/Widgets/game_button_widget.dart';
import 'package:tetris_game/presentation/Widgets/tetris_retro_button.dart';
import 'package:tetris_game/presentation/tetris/controller/tetris_view_controller.dart';
import 'package:tetris_game/core/enums/game_status.dart';

class TetrisView extends GetView<TetrisViewController> {
  const TetrisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Tetris"),
        actions: [_PauseResumeButton(controller)],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Sore and High Score Row
              _ScoreAndHighScoreRow(controller),

              //Board Game Widget with overlay for Pause and Game Over
              Expanded(child: _BoardGameWidget(controller)),

              // Game Controls
              _GameViewControls(controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameViewControls extends StatelessWidget {
  final TetrisViewController controller;

  const _GameViewControls(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Arrow left button
        GameButton(
          icon: Icons.arrow_left_rounded,
          onPressed: controller.moveLeft,
          color: Colors.blueAccent,
        ),

        // Rotate button
        GameButton(
          icon: Icons.rotate_right_rounded,
          onPressed: controller.rotate,
          color: Colors.purpleAccent,
        ),

        // Down button
        GameButton(
          icon: Icons.arrow_downward_rounded,
          onPressed: controller.moveDown,
          color: Colors.greenAccent,
        ),
        // Right
        GameButton(
          icon: Icons.arrow_right_rounded,
          onPressed: controller.moveRight,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}

// Separate widget for Score and High Score Row
class _ScoreAndHighScoreRow extends StatelessWidget {
  final TetrisViewController controller;

  const _ScoreAndHighScoreRow(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Score: ${controller.score.value.points}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "High Score: ${controller.highScore.value}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for Pause/Resume button on app bar
class _PauseResumeButton extends StatelessWidget {
  final TetrisViewController controller;

  const _PauseResumeButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status = controller.status.value;

      // Show nothing if the game is over
      if (status == GameStatus.gameOver) {
        return const SizedBox.shrink();
      }

      return IconButton(
        onPressed: controller.pauseGame,
        icon: Icon(
          status == GameStatus.paused
              ? Icons.play_circle_fill
              : Icons.pause_circle_filled,
          size: 30,
          color: Colors.amberAccent,
        ),
        tooltip: status == GameStatus.paused ? 'Resume Game' : 'Pause Game',
      );
    });
  }
}

// Separate widget for Board Game with some overlays
class _BoardGameWidget extends StatelessWidget {
  final TetrisViewController controller;

  const _BoardGameWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background board widget
        BoardWidget(tetrisBoardController: controller),
        // Overlayed center widget for Pause and Game Over
        Obx(() => getOverlayedCenterWidget(controller.status.value)),
      ],
    );
  }

  // Center overlay widget for Pause and Game Over
  Widget getOverlayedCenterWidget(GameStatus status) {
    if (status == GameStatus.paused) {
      // Pause overlay
      return Container(
        color: Colors.black.withValues(alpha: 0.6),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PAUSED',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 42,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                shadows: [
                  Shadow(blurRadius: 10, color: Colors.yellowAccent),
                  Shadow(blurRadius: 20, color: Colors.orangeAccent),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TetrisRetroButton(text: 'RESUME', onPressed: controller.pauseGame),
          ],
        ),
      );
    } else if (status == GameStatus.gameOver) {
      // Game Over overlay
      return Container(
        color: Colors.black.withValues(alpha: 0.75),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GAME OVER',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
                shadows: [
                  Shadow(blurRadius: 15, color: Colors.redAccent),
                  Shadow(blurRadius: 30, color: Colors.deepOrangeAccent),
                ],
              ),
            ),
            const SizedBox(height: 30),
            TetrisRetroButton(text: 'RESTART', onPressed: controller.startGame),
          ],
        ),
      );
    } else {
      // No overlay
      return const SizedBox.shrink();
    }
  }
}
