import 'package:flutter/material.dart';

class Piece {
  final List<Offset> blocks;
  final Color color;
  final Offset pos;

  const Piece({
    required this.blocks,
    required this.color,
    required this.pos,
  });
  
  Piece copyWith({List<Offset>? blocks, Color? color, Offset? pos}) {
    return Piece(
      blocks: blocks ?? this.blocks,
      color: color ?? this.color,
      pos: pos ?? this.pos,
    );
  }

  Piece rotate() {
    final rotated = blocks.map((b) => Offset(-b.dy, b.dx)).toList();
    return copyWith(blocks: rotated);
  }
}
