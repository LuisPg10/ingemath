import 'package:flutter/material.dart';

class AuxScreen extends StatelessWidget {
  const AuxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Klk"),),
      body: const Center(child: Text("Esto es temporal")),
    );
  }
}