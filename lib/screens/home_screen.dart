import 'package:flutter/material.dart';
import 'package:sdrawkcab/components/form_component.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdrawkcaB'),
      ),
      body: Column(
        children: [
          FormComponent(),
        ],
      ),
    );
  }
}
