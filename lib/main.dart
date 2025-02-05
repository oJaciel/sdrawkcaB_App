import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/providers/history_provider.dart';
import 'package:sdrawkcab/screens/tabs_screen.dart';
import 'package:sdrawkcab/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HistoryProvider(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        home: TabsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
