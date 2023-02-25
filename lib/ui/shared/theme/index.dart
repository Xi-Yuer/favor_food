import 'package:flutter/material.dart';

/// 项目的主题
class ProjectTheme {
  static const double miniFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static const Color normalTextColor = Colors.black54;
  static const Color darkTextColor = Color.fromARGB(255, 180, 180, 180);

  static final ThemeData normalTheme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Colors.white70, // 整个应用程序的背景颜色
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: largeFontSize, color: normalTextColor),
        bodyMedium: TextStyle(fontSize: normalFontSize, color: normalTextColor),
        bodySmall: TextStyle(fontSize: smallFontSize, color: normalTextColor),
        displayLarge:
            TextStyle(fontSize: largeFontSize, color: normalTextColor),
        displayMedium:
            TextStyle(fontSize: normalFontSize, color: normalTextColor),
        displaySmall:
            TextStyle(fontSize: smallFontSize, color: normalTextColor),
      ));

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: darkTextColor,
      brightness: Brightness.dark,
      canvasColor: const Color.fromARGB(255, 35, 35, 35,), // 整个应用程序的背景色
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: largeFontSize, color: darkTextColor),
        bodyMedium: TextStyle(fontSize: largeFontSize, color: darkTextColor),
        bodySmall: TextStyle(fontSize: largeFontSize, color: darkTextColor),
        displayMedium: TextStyle(fontSize: largeFontSize, color: darkTextColor),
        displaySmall: TextStyle(fontSize: largeFontSize, color: darkTextColor),
        displayLarge: TextStyle(fontSize: largeFontSize, color: darkTextColor),
      ));
}
