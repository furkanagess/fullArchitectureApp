import 'package:flutter/material.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance != null) return _instance!;

    _instance = AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
      );

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.greenAccent,
      secondary: Colors.green,
      onSecondary: Colors.black38,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.black87,
      surface: Colors.blue,
      onSurface: Colors.white30,
    );
  }
}
