import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/core/constants/tetromino_constants.dart';
import 'package:tetris_game/presentation/tetris/controller/tetris_view_controller.dart';

class BoardWidget extends StatelessWidget {
  final TetrisViewController tetrisBoardController;
  const BoardWidget({super.key, required this.tetrisBoardController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final piece = tetrisBoardController.currentPiece.value;
      return LayoutBuilder(
        builder: (context, constraints) {
          // Calculate ideal cell size that fits both dimensions
          final cellWidth = constraints.maxWidth / boardColumns;
          final cellHeight = constraints.maxHeight / boardRows;
          final cellSize = cellWidth < cellHeight ? cellWidth : cellHeight;

          // Calculate final board size to avoid overflow
          final boardWidth = cellSize * boardColumns;
          final boardHeight = cellSize * boardRows;

          return Center(
            child: SizedBox(
              width: boardWidth,
              height: boardHeight,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: boardColumns,
                ),
                itemCount: boardRows * boardColumns,
                itemBuilder: (context, index) {
                  final x = index % boardColumns;
                  final y = index ~/ boardColumns;
                  Color? color = tetrisBoardController.board[y][x];

                  if (piece != null) {
                    for (final block in piece.blocks) {
                      final bx = (block.dx + piece.pos.dx).round();
                      final by = (block.dy + piece.pos.dy).round();
                      if (bx == x && by == y) color = piece.color;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: color ?? Colors.grey[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    });
  }
}
