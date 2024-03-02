import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  final String texto;

  const FormFieldText({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: texto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
