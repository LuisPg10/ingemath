import 'package:flutter/material.dart';

class Concept extends StatelessWidget {
  const Concept({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    
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
        const SizedBox(height: 30),
        const Text("FORMULA:"),
        const SizedBox(height: 5),
        const Text("I = Cit "),
      ],
    );
  }
}
