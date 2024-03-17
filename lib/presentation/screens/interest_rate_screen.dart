import 'package:flutter/material.dart';

class InterestRateScreen extends StatelessWidget {
  const InterestRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasa de interés"),
      ),
      body: const Center(child: Text("Tasa de interés")),
    );
  }
}