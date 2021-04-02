import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../config/palette.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Palette.darkMode,
    backgroundColor: Palette.darkMode,
    primaryColor: Palette.darkMode,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Palette.primary, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Palette.lightGrey,
    colorScheme: ColorScheme.light(),
  );
}
