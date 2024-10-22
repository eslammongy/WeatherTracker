import 'package:flutter/material.dart';
import 'package:weather_tracker/core/utils/user_pref.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    getAppPreferenceTheme();
  }

// Default theme is dark
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

// Method to toggle theme
  void toggleTheme(ThemeMode mode) {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners(); // Notify all listeners about the change
  }

// Get the current theme
  ThemeMode get themeMode {
    return _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  void getAppPreferenceTheme() {
    final themeMode = SharedPref.getSelectedAppTheme();
    if (themeMode == ThemeModes.darkTheme.name) {
      _isDarkTheme = true;
    } else {
      _isDarkTheme = false;
    }
  }
}
