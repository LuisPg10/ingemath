import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingemath/config/menu/operation_options.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenidos a IngeMath"),
      ),
      body: Column(
        children: [

          const SizedBox(height: 10),
          const Text("Elige la herramienta contable de tu interes"),
          
          const SizedBox(height: 5),
      
          Expanded(
            child: ListView.builder(
              itemCount: appMenuOptions.length,
              itemBuilder: (context, index) {
                final option = appMenuOptions[index];

                return GestureDetector(
                  onTap: () => context.push("/operations/${option.link}"),
                  child: ListTile(
                    title: Text(option.name),
                  ),
                );
              },
            )
          )
      
        ],
      ),
    );
  }
}