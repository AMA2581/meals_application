import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

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
    if (Platform.isAndroid){
    return MaterialApp(
      theme: _theme(),
      home: // Todo ...,
    );} else {
      return CupertinoApp(
        theme: ,
      );
    }
  }
}

ThemeData _theme(){

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

CupertinoThemeData _cupertinoTheme(){
  final cupertinoTheme = CupertinoThemeData(
    primaryColor: 
  );
}