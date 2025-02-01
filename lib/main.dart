import 'package:flutter/material.dart';
import 'package:sdrawkcab/screens/home_screen.dart';
import 'package:sdrawkcab/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}