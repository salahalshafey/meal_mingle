import 'package:flutter/material.dart';

ThemeData myLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(224, 168, 0, 1), //GoldenRod
      primary: const Color.fromRGBO(224, 168, 0, 1),
      secondary: const Color.fromARGB(255, 231, 116, 132), //Terra Cotta
    ),
    appBarTheme: const AppBarTheme(
        // backgroundColor: Color.fromARGB(255, 238, 240, 242),
        ),
    canvasColor: const Color.fromARGB(255, 238, 240, 242),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            // color: Colors.white,
            fontSize: 20,
            color: Color.fromARGB(255, 44, 54, 63),
            overflow: TextOverflow.clip,
            fontFamily: 'Allan',
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
          ),
          bodySmall: const TextStyle(
            fontSize: 32,
            fontFamily: 'Allan',
            // fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
              // color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          displaySmall: const TextStyle(
            color: Color.fromARGB(255, 44, 54, 63),
            fontSize: 18,
            fontFamily: 'Metrophobic',
          ),
          displayLarge: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
          displayMedium: const TextStyle(
            fontSize: 30,
            letterSpacing: 1,
          ),
          headlineMedium: const TextStyle(
            fontSize: 22,
            fontFamily: 'Allan',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 44, 54, 63),
          ),
          titleSmall: const TextStyle(
            fontSize: 26,
            fontFamily: 'Allan',
            color: Color.fromARGB(255, 44, 54, 63),
          ),
        ),
  );
}
