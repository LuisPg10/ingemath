import 'package:flutter/material.dart';

class ConceptionCompoundInterest extends StatelessWidget {
  const ConceptionCompoundInterest({
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
                text:
                    'Es el interés que se llega a cobrar por un crédito que cuando es liquidado se agrega al capital, razón por la cual en la liquidación que prosigue, el primer interés pasará a formar parte del capital del nuevo interés.\n ',
              ),
              TextSpan(
                text: '\n La ecuacion de interes compuesto es:',
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("FORMULA:"),
        const SizedBox(height: 5),
        const Text("I = MC - C"),
        const SizedBox(height: 40),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: textStyles.bodySmall,
            children: const <TextSpan>[
              TextSpan(
                text: 'Donde:',
              ),
              TextSpan(
                text: ' (MC) es el Monto Compuesto o Valor Futuro (VF) y',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' (C) es el Capital o Valor Presente (VP)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
