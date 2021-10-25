import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
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
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardColor: Colors.grey.shade800,
    hintColor: Colors.white,
    cursorColor: Colors.white,
    canvasColor: Colors.white,
    dividerColor: Colors.grey.shade400,
    primaryColor: Colors.white,
    accentColor: Colors.grey.shade900,
    buttonColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    hintColor: Colors.white,
    cardColor: Colors.white,
    cursorColor: Colors.black,
    primaryColor: Colors.black,
    buttonColor: Colors.grey.shade900,
    canvasColor: Colors.white,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
