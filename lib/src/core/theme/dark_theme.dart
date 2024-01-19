import 'package:flutter/material.dart';

ThemeData myDarkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(95, 190, 30, 1),
      brightness: Brightness.dark,
      primary: const Color.fromRGBO(95, 190, 30, 1),
      secondary: const Color.fromRGBO(95, 190, 30, 1),
    ),
    //  canvasColor: const Color.fromARGB(255, 238, 240, 242),
  );
}
