# 🎮 Flutter Tetris Game

A fully functional **Tetris clone** built with **Flutter**, following **Clean Architecture** principles and powered by **GetX** for state management.  

This project demonstrates advanced app structure, local persistence, reactive UIs, and a nostalgic retro Tetris experience — all written in pure Dart.  

---

## 🚀 Features

- 🧱 **Classic Tetris Gameplay** – move, rotate, and drop tetromino pieces  
- ⏸️ **Pause and Resume** – freeze the action and come back without losing progress  
- 💯 **Score & High Score System** – dynamically updated scores, stored locally  
- 🏆 **High Scores List** – view your best plays with rank, date, and points  
- 🧹 **Clear Scores Option** – delete all records directly from the high scores screen  
- 📲 **Responsive UI** – automatically fits any screen size, built using Flutter’s layout system  
- 🧩 **Clean Architecture Layers** – separation of concerns between UI, domain logic, and data handling  
- ⚡ **Reactive with GetX** – seamless updates and navigation management  

---

## 🧠 Project Structure

lib/
├── core/
│ ├── constants/ # Game constants (board size, colors, etc.)
│ ├── enums/ # Enums (GameStatus, etc.)
│ ├── models/ # Core game models like Piece
│
├── data/
│ ├── datasource/ # Local database (SQLite) logic
│ ├── dtos/ # Data Transfer Objects
│ ├── repository/ # Repository implementations
│
├── domain/
│ ├── entities/ # Business entities (Score)
│ ├── repository/ # Abstract repository interfaces
│ ├── usecases/ # Application use cases (GetHighScores, SaveScore, etc.)
│
├── presentation/
│ ├── home/
│ │ ├── view/ # Home screen UI
│ │ ├── controller/ # HomeViewController (handles high score loading)
│ ├── tetris/
│ │ ├── view/ # Main game UI (board, buttons, overlays)
│ │ ├── controller/ # TetrisViewController (handles game logic)
│ │ ├── bindings/ # Dependency injection setup
│ ├── highscores/
│ │ ├── view/ # List of saved high scores
│ │ ├── controller/ # Handles score loading and clearing
│
└── main.dart # Entry point, route setup, GetMaterialApp

---

## ⚙️ Architecture Overview

The app follows **Clean Architecture**, separating layers to keep logic independent and testable:

| **Layer** | **Responsibility** |
|------------|--------------------|
| **Presentation** | Flutter UI & GetX controllers for state and navigation |
| **Domain** | Pure Dart business logic and use cases (no Flutter dependencies) |
| **Data** | Handles persistence and repositories (SQLite or local storage) |
| **Core** | Shared constants, enums, and helper models used across the app |

---

## 🧩 Dependencies

| **Package** | **Purpose** |
|--------------|-------------|
| `get` | State management and navigation |
| `sqflite` | Local database storage |
| `path_provider` | File system access for SQLite |
| `flutter` | The UI framework itself |
| `intl` | Date formatting for score timestamps |

---

## 🕹️ Gameplay Logic

- Each **tick** moves the current piece down  
- When a row is completely filled, it clears and awards points:  
  - 🟦 1 line → **40 pts**  
  - 🟩 2 lines → **100 pts**  
  - 🟨 3 lines → **300 pts**  
  - 🟥 4 lines → **1200 pts**  
- When a piece can’t spawn due to collision → **Game Over**  
- On Game Over, your **score is saved** if it beats your previous high score  

---

## 🏗️ Installation

### 1️⃣ Clone the repo
```bash
git clone git@github.com:Kilder-M/tetris_game.git
cd flutter_tetris

2️⃣ Install dependencies
flutter pub get

3️⃣ Run the app
flutter run


