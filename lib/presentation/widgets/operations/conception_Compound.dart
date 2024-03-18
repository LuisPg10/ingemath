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
                    'El interés compuesto es cuando los intereses generados se agregan al capital inicial en cada período, lo que resulta en un crecimiento exponencial del capital a lo largo del tiempo.\n ',
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
        const SizedBox(height: 20),
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
        const Divider(
              color: Color(0xFFFF833D),
              thickness: 2,
              indent: 2,
              endIndent: 2,
            ),
        const SizedBox(height: 30),
      ],
    );
  }
}
