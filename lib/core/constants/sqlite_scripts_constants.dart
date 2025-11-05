const createScoreTable = '''
 CREATE TABLE IF NOT EXISTS scores(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        points INTEGER NOT NULL,
        created_at TEXT NOT NULL
 )
''';
