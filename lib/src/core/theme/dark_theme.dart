import 'package:flutter/material.dart';

ThemeData myDarkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(224, 168, 0, 1), //GoldenRod
      primary: const Color.fromRGBO(224, 168, 0, 1),
      secondary: const Color.fromARGB(255, 231, 116, 132), //Terra Cotta
    ),
    canvasColor: const Color.fromARGB(255, 238, 240, 242),
  );
}
