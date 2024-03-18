import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class Concept extends StatelessWidget {

  final String definition;
  final List<String> important;
  final List<String> equations;

  const Concept({
    super.key,
    required this.definition,
    this.important = const [],
    required this.equations,
  });

  @override
  Widget build(BuildContext context) {
    
    final textStyles = Theme.of(context).textTheme;

    List<TextSpan> textSpans = [];
    int currentIndex = 0;

    // Iterate over each important word and find its occurrences in the definition

    for (String word in important) {
      int index = definition.indexOf(word, currentIndex);
      if (index != -1) {

        // Add preceding non-important text
        if (index > currentIndex) {
          textSpans.add(
            TextSpan(text: definition.substring(currentIndex, index)),
          );
        }
        // Add important text with bold style
        textSpans.add(
          TextSpan(
            text: definition.substring(index, index + word.length),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        currentIndex = index + word.length;
      }
    }

    // Add remaining non-important text
    if (currentIndex < definition.length) {
      textSpans.add(
        TextSpan(text: definition.substring(currentIndex)),
      );
    }

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: textStyles.bodySmall,
            children: textSpans,
          ),
        ),
        const SizedBox(height: 30),
        const Text("FORMULA:"),
        const SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 15,
          children: [
            ...equations.map((equation) => Math.tex(equation))
          ]
        ),
      ],
    );
  }
}