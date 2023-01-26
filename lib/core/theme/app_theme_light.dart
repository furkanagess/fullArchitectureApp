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
        tabBarTheme: _tabBarTheme,
        appBarTheme: _appBarTheme,
        colorScheme: _appColorScheme,
        inputDecorationTheme: _inputDecorationTheme,
      );

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelPadding: EdgeInsets.zero,
      labelColor: _appColorScheme.onPrimary,
      unselectedLabelColor: _appColorScheme.onPrimary.withOpacity(0.2),
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _appColorScheme.primary,
        size: 15,
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.3),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 0.3),
      ),
      focusedBorder: OutlineInputBorder(),
    );
  }

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black, //used
      onPrimary: Colors.greenAccent, //used
      secondary: Colors.green,
      onSecondary: Colors.black54,
      error: Colors.red, //used
      onError: Colors.pink,
      background: Colors.white, //used
      onBackground: Color(0xfff1f3f8), //used
      surface: Colors.blue,
      onSurface: Colors.white30,
    );
  }
}
