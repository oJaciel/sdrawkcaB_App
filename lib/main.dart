import 'package:flutter/material.dart';
import 'package:sdrawkcab/screens/home_screen.dart';
import 'package:sdrawkcab/screens/result_screen.dart';
import 'package:sdrawkcab/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.RESULT_SCREEN: (ctx) => ResultScreen(),
      },
    );
  }
}