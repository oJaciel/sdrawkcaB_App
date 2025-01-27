import 'package:flutter/material.dart';
import 'package:sdrawkcab/components/result_component.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: ResultComponent(),
    );
  }
}
