import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/core/constants/tetromino_constants.dart';
import 'package:tetris_game/core/models/piece.dart';
import 'package:tetris_game/core/enums/game_status.dart';

class TetrisViewController extends GetxController {
  // Reactive board
  final RxList<RxList<Color?>> board = RxList.generate(
    boardRows,
    (_) => RxList<Color?>.filled(boardColumns, null, growable: false),
  );

  // Current piece
  Rx<Piece?> currentPiece = Rx<Piece?>(null);

  // Game status
  Rx<GameStatus> status = GameStatus.playing.obs;

  Timer? timer;

  RxInt score = 0.obs;
  RxInt highScore = 0.obs;

  @override
  void onInit() {
    super.onInit();
    startGame();
  }

  void startGame() {
    
    //clear previous game score
    score.value = 0;

    // Clear board
    for (int y = 0; y < boardRows; y++) {
      board[y] = RxList<Color?>.filled(boardColumns, null, growable: false);
    }

    status.value = GameStatus.playing;
    _spawnPiece();

    timer?.cancel();
    timer = Timer.periodic(tickDuration, (_) => _tick());
  }

  void pauseGame() {
    if (status.value == GameStatus.playing) {
      status.value = GameStatus.paused;
      timer?.cancel();
    } else if (status.value == GameStatus.paused) {
      status.value = GameStatus.playing;
      timer = Timer.periodic(tickDuration, (_) => _tick());
    }
  }

  void _spawnPiece() {
    final i = Random().nextInt(tetrominoShapes.length);
    currentPiece.value = Piece(
      blocks: tetrominoShapes[i],
      color: tetrominoColors[i],
      pos: Offset((boardColumns ~/ 2).toDouble(), 0),
    );
  }

  void _tick() {
    if (status.value != GameStatus.playing) return;

    if (!_movePiece(const Offset(0, 1))) {
      _mergePiece();
      _clearLines();
      _spawnPiece();

      if (_isCollision(currentPiece.value!)) {
        status.value = GameStatus.gameOver;
        timer?.cancel();
      }
    }
  }

  bool _movePiece(Offset delta) {
    if (status.value != GameStatus.playing) return false;

    final moved = currentPiece.value!.copyWith(
      pos: currentPiece.value!.pos + delta,
    );
    if (!_isCollision(moved)) {
      currentPiece.value = moved;
      return true;
    }
    return false;
  }

  void moveLeft() => _movePiece(const Offset(-1, 0));
  void moveRight() => _movePiece(const Offset(1, 0));
  void moveDown() => _movePiece(const Offset(0, 1));

  void rotate() {
    if (status.value != GameStatus.playing) return;

    final rotated = currentPiece.value!.rotate();
    if (!_isCollision(rotated)) {
      currentPiece.value = rotated;
    }
  }

  bool _isCollision(Piece piece) {
    for (final block in piece.blocks) {
      final x = (block.dx + piece.pos.dx).round();
      final y = (block.dy + piece.pos.dy).round();
      if (x < 0 || x >= boardColumns || y >= boardRows) return true;
      if (y >= 0 && board[y][x] != null) return true;
    }
    return false;
  }

  void _mergePiece() {
    for (final block in currentPiece.value!.blocks) {
      final x = (block.dx + currentPiece.value!.pos.dx).round();
      final y = (block.dy + currentPiece.value!.pos.dy).round();
      if (y >= 0 && y < boardRows && x >= 0 && x < boardColumns) {
        board[y][x] = currentPiece.value!.color;
      }
    }
    board.refresh();
  }

  void _clearLines() {
    int linesCleared = 0;

    for (int y = boardRows - 1; y >= 0; y--) {
      if (board[y].every((cell) => cell != null)) {
        linesCleared++;
        for (int yy = y; yy > 0; yy--) {
          board[yy] = RxList<Color?>.from(board[yy - 1]);
        }
        board[0] = RxList<Color?>.filled(boardColumns, null, growable: false);
        y++;
      }
    }

    if (linesCleared > 0) {
      // Classic Tetris scoring system: 40, 100, 300, 1200 per 1/2/3/4 lines
      final Map<int,int> scoreTable = {1: 40, 2: 100, 3: 300, 4: 1200};
      score.value += scoreTable[linesCleared] ?? (linesCleared * 50);

      // Update high score if necessary
      if (score.value > highScore.value) {
        highScore.value = score.value;
      }
    }

    board.refresh();
  }
}
