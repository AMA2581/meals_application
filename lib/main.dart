import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_application/android/screens/tabs.dart';
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
    if (Platform.isAndroid) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: _cupertinoTheme(),
        home: const CategoriesScreenIOS(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: const TabsScreen(),
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
