import 'package:flutter/material.dart';

class OperationsDropDownMenu extends StatelessWidget {
  final Map<String, String> options;
  final String? errorText;
  final void Function(String?)? onSelected;

  const OperationsDropDownMenu({
    super.key,
    required this.options,
    this.errorText,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      hintText: "Variable a calcular",
      errorText: errorText,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _customBorder(),
        disabledBorder: _customBorder(color: Colors.black12),
        errorBorder: _customBorder(color: Colors.red.shade800),
        isDense: true,
      ),
      dropdownMenuEntries: options.entries.map(
        (option) => DropdownMenuEntry(
          value: option.key,
          label: option.value,
        )
      ).toList(),
      onSelected: onSelected,
    );
  }

  InputBorder _customBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? const Color(0xFF000000)),
    );
  }
}