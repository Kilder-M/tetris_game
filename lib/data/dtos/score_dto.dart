import 'package:tetris_game/domain/entities/score.dart';

class ScoreDto extends Score {
  ScoreDto({super.id, required super.points, required super.createdAt});

  factory ScoreDto.fromMap(Map<String, dynamic> map) {
    return ScoreDto(
      id: map['id'] as int?,
      points: map['points'] as int,
      createdAt: DateTime.parse(map['created_at'] as String )
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'points': points, 'created_at': createdAt.toIso8601String()};
  }

  factory ScoreDto.fromEntity(Score score) {
    return ScoreDto(
      id: score.id,
      points: score.points,
      createdAt: score.createdAt,
    );
  }

  Score toEntity() {
    return Score(id: id, points: points, createdAt: createdAt);
  }
}
