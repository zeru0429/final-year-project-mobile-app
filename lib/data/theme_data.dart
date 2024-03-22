import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF075E54), // Green color for primary
    onPrimary: Colors.white, // Text color on primary
    secondary: Color(0xFF128C7E), // Dark green color for secondary
    onSecondary: Colors.white, // Text color on secondary
    error: Color(0xFFB00020), // Error color
    onError: Colors.white, // Text color on error
    background: Color(0xFFFFFFFF), // Background color
    onBackground:
        Color.fromARGB(220, 236, 229, 221), // Text color on background
    surface: Color(0xFFFFFFFF), // Surface color
    onSurface: Color(0xFF757575), // Text color on surface
  ),
);

ThemeData nightMode = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF075E54), // Green color for primary
    onPrimary: Color.fromARGB(12, 255, 255, 255), // Text color on primary
    secondary:
        Color.fromARGB(255, 13, 160, 91), // Dark green color for secondary
    onSecondary: Colors.white, // Text color on secondary
    error: Color(0xFFB00020), // Error color
    onError: Colors.white, // Text color on error
    background: Color.fromARGB(8, 245, 245, 245), // Background color
    onBackground: Color(0xFF757575), // Text color on background
    surface: Color(0xFF121212), // Surface color
    onSurface: Color.fromARGB(213, 236, 229, 221), // Text color on surface
  ),
);
