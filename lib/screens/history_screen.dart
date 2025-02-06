import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/components/empty_history_component.dart';
import 'package:sdrawkcab/components/history_item_component.dart';
import 'package:sdrawkcab/providers/phrase_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhraseProvider>(context);

    List _history = provider.getHistory();

    if (_history.isNotEmpty) {
      return ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) => HistoryItemComponent(_history[index]),
      );
    } else {
      return EmptyHistoryComponent();
    }
  }
}
