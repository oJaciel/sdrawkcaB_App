import 'package:flutter/material.dart';
import 'package:sdrawkcab/utils/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdrawkcaB'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.RESULT_SCREEN),
            icon: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
