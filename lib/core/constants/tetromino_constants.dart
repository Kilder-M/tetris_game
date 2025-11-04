import 'package:flutter/material.dart';

const int boardRows = 20;
const int boardColumns = 10;
const Duration tickDuration = Duration(milliseconds: 500);

//Make a class for tetromino shapes and colors
const List<List<Offset>> tetrominoShapes = [
  [Offset(0, 0), Offset(1, 0), Offset(0, 1), Offset(1, 1)], // O
  [Offset(-1, 0), Offset(0, 0), Offset(1, 0), Offset(0, 1)], // T
  [Offset(-1, 0), Offset(0, 0), Offset(1, 0), Offset(2, 0)], // I
  [Offset(0, 0), Offset(1, 0), Offset(0, 1), Offset(-1, 1)], // S
  [Offset(-1, 0), Offset(0, 0), Offset(0, 1), Offset(1, 1)], // Z
  [Offset(-1, 0), Offset(0, 0), Offset(1, 0), Offset(1, 1)], // L
  [Offset(-1, 0), Offset(0, 0), Offset(1, 0), Offset(-1, 1)], // J
];

const List<Color> tetrominoColors = [
  Colors.yellow,
  Colors.purple,
  Colors.cyan,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.blue,
];
