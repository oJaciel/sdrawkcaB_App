import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
        .copyWith(secondary: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepOrange,
      titleTextStyle: TextStyle(
        color: Colors.deepOrange,
        fontSize: 24,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.deepOrange,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[200],
      selectedLabelStyle: TextStyle(
        fontSize: 16,
      ),
    ),
  );

  static final InputDecoration formTextStyle = InputDecoration(
    hintText: "Digite uma palavra/frase",
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    filled: true,
    fillColor: Colors.grey[100],
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
  );

  static final formButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
    textStyle: const TextStyle(
      fontSize: 16,
    ),
  );
}
