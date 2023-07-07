import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_application/android/screens/categories.dart';
import 'package:meals_application/ios/screens/categories_ios.dart';

// if (Platform.isAndroid){
// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 131, 57, 0),
//   ),
//   textTheme: GoogleFonts.latoTextTheme(),
// );}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return MaterialApp(
        theme: _theme(),
        home: CategoriesScreen(),
      );
    } else {
      return CupertinoApp(
        theme: _cupertinoTheme(),
        home: CategoriesScreenIOS(),
      );
    }
  }
}

ThemeData _theme() {
  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  return theme;
}

CupertinoThemeData _cupertinoTheme() {
  const cupertinoTheme = CupertinoThemeData(
    primaryColor: CupertinoDynamicColor(
      color: CupertinoColors.systemBlue,
      darkColor: CupertinoColors.white,
      highContrastColor: CupertinoColors.systemBlue,
      darkHighContrastColor: CupertinoColors.white,
      elevatedColor: CupertinoColors.systemBlue,
      darkElevatedColor: CupertinoColors.white,
      highContrastElevatedColor: CupertinoColors.systemBlue,
      darkHighContrastElevatedColor: CupertinoColors.white,
    ),
  );

  return cupertinoTheme;
}
