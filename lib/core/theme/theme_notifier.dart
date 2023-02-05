import 'package:flutter/material.dart';
import 'package:random_full_app/core/theme/app_theme_enum.dart';
import 'package:random_full_app/core/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  AppThemes get currentThemeEnum => _currentThemeEnum;

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeValue(AppThemes themes) {
    if (themes == AppThemes.LIGHT) {
      _currentThemeEnum = AppThemes.DARK;
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
