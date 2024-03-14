import 'package:flutter/material.dart';

class DefinitionSimpleInterest extends StatelessWidget {
  const DefinitionSimpleInterest({
    super.key,
    required this.textStyles,
  });

  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: textStyles.bodySmall,
            children: const <TextSpan>[
              TextSpan(
                text: 'El interés simple (I), es el que se cobra sobre el ',
              ),
              TextSpan(
                text: 'capital (C) o Valor Presente (VP)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' por un cierto ',
              ),
              TextSpan(
                text: 'tiempo (t)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ', expresado en años.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("FORMULA:"),
        const SizedBox(height: 5),
        const Text("I = Cit "),
        const SizedBox(height: 40),
      ],
    );
  }
}
