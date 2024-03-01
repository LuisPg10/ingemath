import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  final String texto;

  const FormFieldText({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: texto),
    );
  }
}
