class Score {
  int? id;
  int points;
  DateTime createdAt;

  Score({this.id, required this.points, required this.createdAt});

  Score copyWith({int? id, int? points, DateTime? createdAt}) {
    return Score(
      id: id ?? this.id,
      points: points ?? this.points,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
