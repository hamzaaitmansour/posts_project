# Posts App - Flutter Clean Architecture

A simple Flutter application demonstrating Clean Architecture principles with CRUD operations on posts using JSONPlaceholder API.

## 🏗️ Architecture

This project follows **Clean Architecture** with separation of concerns across three layers:

- **Domain Layer**: Entities, Use Cases, Repository Interfaces
- **Data Layer**: Models, Data Sources (Remote & Local), Repository Implementation
- **Presentation Layer**: UI Pages, State Management (Provider)

## 🛠️ Tech Stack

- **Flutter** - UI Framework
- **Provider** - State Management
- **GetIt** - Dependency Injection
- **Dio** - HTTP Client
- **GoRouter** - Navigation
- **Dartz** - Functional Programming (Either for error handling)
- **SharedPreferences** - Local Caching
- **Connectivity Plus** - Network Status Check

## ✨ Features

- ✅ Get all posts
- ✅ Delete posts
- ✅ Offline caching
- ✅ Error handling

## 📁 Project Structure
```
lib/
├── core/
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── network/
│   │   ├── connection_checker.dart
│   │   └── dio_config.dart
│   └── dependency_injection.dart
├── features/
│   └── posts/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── controller/
│           └── pages/
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Dart SDK (3.0+)

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/posts_app.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📦 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  get_it: ^7.6.4
  dio: ^5.4.0
  go_router: ^13.0.0
  dartz: ^0.10.1
  equatable: ^2.0.5
  shared_preferences: ^2.2.2
  connectivity_plus: ^5.0.2
```

## 🌐 API

This app uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/) - A free fake REST API for testing and prototyping.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

Made with ❤️ using Flutter
