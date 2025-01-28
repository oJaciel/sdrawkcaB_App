import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

final _formKey = GlobalKey<FormState>();

class _FormComponentState extends State<FormComponent> {
  final formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                decoration:
                    const InputDecoration(hintText: "Digite uma palavra"),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
