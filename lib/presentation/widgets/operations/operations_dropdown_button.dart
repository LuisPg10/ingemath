import 'package:flutter/material.dart';

class OperationsDropDownButton extends StatelessWidget {
  final Map<String, String> options;
  final void Function(String?)? onChanged;

  const OperationsDropDownButton({
    super.key,
    required this.options,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      elevation: 2,
      isExpanded: true,
      value: "amount",
      items: options.entries.map((option) => DropdownMenuItem(
        value: option.key,
        child: Text(option.value)
      )).toList(),
      onChanged: onChanged,
    );
  }
}