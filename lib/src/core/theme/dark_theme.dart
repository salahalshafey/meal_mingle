import 'package:flutter/material.dart';

ThemeData myDarkTheme(Color color) {
  return ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
      primary: color,
      secondary: color,
    ),
    //  canvasColor: const Color.fromARGB(255, 238, 240, 242),
    // fontFamily: 'Raleway',
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(
            // color: Colors.white,
            fontSize: 20,
            color: Color.fromARGB(255, 197, 206, 214),
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
            color: Color.fromARGB(255, 197, 206, 214),
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
            color: Color.fromARGB(255, 197, 206, 214),
          ),
          titleSmall: const TextStyle(
            fontSize: 26,
            fontFamily: 'Allan',
            color: Color.fromARGB(255, 197, 206, 214),
          ),
        ),
  );
}
