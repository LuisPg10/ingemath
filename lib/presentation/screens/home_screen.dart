import 'package:flutter/material.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomLines(),
          Align(alignment: Alignment.bottomRight, child: CustomLines()),
          Center(child: Text("IngeMath")),
        ],
      ),
    );
  }
}
