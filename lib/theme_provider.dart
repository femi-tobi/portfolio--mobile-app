import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark().copyWith(
          primaryColor: Colors.black87,
          scaffoldBackgroundColor: const Color(0xFF121212),
          cardColor: const Color(0xFF1E1E1E),
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white70),
            bodyMedium: TextStyle(color: Colors.white60),
            bodySmall: TextStyle(color: Colors.white54),
          ),
          iconTheme: const IconThemeData(color: Colors.white70),
        )
      : ThemeData.light().copyWith(
          primaryColor: Colors.black87,
          scaffoldBackgroundColor: const Color(0xFFF9FAFB),
          cardColor: Colors.white,
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.black87),
            titleLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black54),
            bodySmall: TextStyle(color: Colors.black54),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
        );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}