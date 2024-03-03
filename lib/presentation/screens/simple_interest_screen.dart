import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatelessWidget {
  const SimpleInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Klk")),
      body: const Center(child: Text("Interés simple :)")),
    );
  }
}