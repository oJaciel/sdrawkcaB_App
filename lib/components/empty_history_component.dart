import 'package:flutter/material.dart';

class EmptyHistoryComponent extends StatelessWidget {
  const EmptyHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Icon(
              Icons.highlight_off,
              size: 90,
            ),
          ),
          Text(
            'Histórico vazio!',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            'Inverta uma frase para adicioná-la ao histórico',
            style: TextStyle(color: Colors.black87),
          )
        ],
      ),
    );
  }
}
