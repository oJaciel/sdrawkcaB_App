import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
        .copyWith(secondary: Colors.white)
  );
}
