import 'package:flutter/material.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Bienvenidos a IngeMath",
            style: textStyles.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
      
          const SizedBox(height: 10),
          const Text("Elige la herramienta contable de tu interes"),
          
          const SizedBox(height: 5),
      
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const Text("Hola");
              },
            )
          )
      
        ],
      ),
    );
  }
}