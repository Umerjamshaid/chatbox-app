# 📱 ChatBox - Flutter Messaging App

ChatBox is a modern messaging app built using **Flutter** and **Firebase**, designed to be clean, scalable, and beginner-friendly. This project is perfect for learning how to integrate authentication, Firestore, and reusable UI components in a real-world Flutter app.

---

## 🚀 Getting Started

If you're new to Flutter, here are some helpful resources to get you up and running:

* 📘 [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* 🍳 [Cookbook: Useful Flutter examples](https://docs.flutter.dev/cookbook)
* 🧭 [Official Flutter documentation](https://docs.flutter.dev/)

To run this project:

```bash
flutter pub get
flutter run
```

---

## 🗂 Recommended Folder Structure

To keep the project organized and scalable, the following folder structure is used:

```
lib/
│
├── core/                     # App-wide constants, themes, utilities
│   ├── constants.dart
│   ├── themes.dart
│   └── utils/
│       └── validators.dart
│
├── data/                     # Models and services (e.g., Firebase, APIs)
│   ├── models/               # UserModel, MessageModel, etc.
│   ├── services/             # FirebaseAuth, Firestore logic
│   └── repositories/         # Business logic abstractions
│
├── presentation/             # UI components (screens, widgets)
│   ├── screens/              # Login, Home, Chat, etc.
│   └── widgets/              # Custom widgets like buttons, input fields
│
├── routes/                   # Centralized route management
│   └── app_routes.dart
│
├── firebase_options.dart     # Auto-generated Firebase config
└── main.dart                 # App entry point
```

---

## 📁 Folder Purpose

| Folder                  | Description                                                 |
| ----------------------- | ----------------------------------------------------------- |
| `core/`                 | App-level constants, styles, helper functions               |
| `data/models/`          | Defines app models (e.g. user, messages)                    |
| `data/services/`        | Firebase/Auth/Storage APIs                                  |
| `data/repositories/`    | Business logic layer that connects services to the UI       |
| `presentation/screens/` | All UI screens (`Login`, `Home`, `Chat`, etc.)              |
| `presentation/widgets/` | Reusable UI components (`CustomButton`, `ChatBubble`, etc.) |
| `routes/`               | Central location for defining named routes                  |

---

## 🧩 Example Usage

A custom login button located at:

```
lib/presentation/widgets/login_button.dart
```

Can be used in any screen with:

```dart
import 'package:chatbox/presentation/widgets/login_button.dart';
```

---

## ✨ Suggestions for Clean Code

* ✅ Rename `Screens/` ➜ `presentation/screens/`
* ✅ Follow `snake_case` for file and folder names

    * Example: `login_in_screen.dart` ➜ `login_screen.dart`

---

## 🔧 Quickly Set Up This Structure via CLI

You can scaffold this structure using a terminal command:

```bash
mkdir -p lib/{core,data/{models,services,repositories},presentation/{screens,widgets},routes}
```

---

## 📬 Need Help?

Want to:

* Organize or move files into this structure?
* Set up Firebase Auth or Firestore properly?
* Create reusable widgets or models?


