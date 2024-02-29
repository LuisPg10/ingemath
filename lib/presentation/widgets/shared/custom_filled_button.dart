import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilledButton extends StatelessWidget {

  final void Function()? onPressed;
  final Widget child;
  final Color? buttonColor;

  const CustomFilledButton({
    super.key, 
    this.onPressed, 
    required this.child, 
    this.buttonColor
  });

  @override
  Widget build(BuildContext context) {

    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: buttonColor),
      onPressed: onPressed, 
      child: child
    );
  }
}
