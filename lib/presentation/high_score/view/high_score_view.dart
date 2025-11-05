import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/domain/entities/score.dart';
import 'package:tetris_game/presentation/high_score/controller/high_score_controller.dart';

class HighScoresView extends GetView<HighScoresController> {
  const HighScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('High Scores')),
      body: Obx(() {
        final scores = controller.scores;

        if (scores.isEmpty) {
          return const Center(
            child: Text(
              'No high scores yet!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  final Score s = scores[index];
                  final rank = index + 1;
                  return ListTile(
                    leading: Text(
                      '#$rank',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    title: Text(
                      '${s.points} pts',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Achieved on ${s.createdAt.toLocal().toString().split(" ")[0]}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: controller.clearHighScores,
              icon: const Icon(Icons.delete_forever),
              label: const Text('CLEAR ALL', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}
