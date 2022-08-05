import 'package:flutter/foundation.dart';
import 'package:techka/models/theme_preferences.dart';

class UserThemeProvider with ChangeNotifier {
  ThemePreferences themePreferences = ThemePreferences();
  int _theme = 0;

  int get userTheme => _theme;

  set userTheme(int value) {
    _theme = value;
    themePreferences.setUserTheme(_theme);
    notifyListeners();
  }
}
