import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';

class AppTheme {
  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      extensions: [
        _lightAppColors,
      ],
    );
  }();

  static final _lightAppColors = AppColorEx(
    primary: const Color(0xFF6835DE),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffff3201),
    onError: Colors.white,
    background: const Color(0xFFD5D5D5),
    onBackground: Colors.black,
    surface: const Color(0xFFEDEDED),
    onSurface: Colors.black,
    tertiary: const Color(0xFFA1A1A1),
  );

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      extensions: [
        _darkAppColors,
      ],
    );
  }();

  static final _darkAppColors = AppColorEx(
    primary: const Color(0xFF6835DE),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffff3201),
    onError: Colors.black,
    background: const Color(0xff121212),
    onBackground: Colors.white,
    surface: const Color(0xff262626),
    onSurface: Colors.white,
    tertiary: const Color(0xFFB1B1B1),
  );
}

/// Here you should define getters for your `ThemeExtension`s.
/// Never use `Theme.of(context).extension<MyColors>()!`
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorEx get appColors =>
      extension<AppColorEx>() ?? AppTheme._lightAppColors;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorSchemeGetter on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
