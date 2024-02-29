import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IngeMathLogo(size: 150),
          
          const Text("IngeMath"),
          const Text("Money"),

          const SizedBox(height: 150),
          
          CustomFilledButton(
            buttonColor: const Color(0xFFFF833D),
            onPressed: () => context.push("/operations"),
            child: const Text("Ingresar", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
