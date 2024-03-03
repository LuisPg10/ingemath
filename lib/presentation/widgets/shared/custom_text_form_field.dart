import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? enable;
  final TextInputType keyBoardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.enable,
    this.keyBoardType = TextInputType.number,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      enabled: enable,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        enabledBorder: _customBorder(),
        disabledBorder: _customBorder(color: Colors.black12),
        focusedBorder: _customBorder(color: colors.primary),
        errorBorder: _customBorder(color: Colors.red.shade800),
        focusedErrorBorder: _customBorder(color: Colors.red.shade800),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
      ),
    );
  }

  InputBorder _customBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? const Color(0xFF000000)),
    );
  }
}
