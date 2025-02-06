import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/components/result_component.dart';
import 'package:sdrawkcab/providers/phrase_provider.dart';
import 'package:sdrawkcab/theme/app_theme.dart';

class MainScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhraseProvider>(context);

    openResultModal(BuildContext context, String id) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return ResultComponent(id);
        },
      );
    }

    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: formController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira algum texto';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: AppTheme.formTextStyle,
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: AppTheme.formButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newPhrase =
                          provider.addPhraseToHistory(formController.text);
                      openResultModal(context, newPhrase.id);
                    }
                  },
                  child: const Text(
                    'Inverter Texto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
