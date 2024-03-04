import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:ingemath/config/menu/operation_options.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenidos a IngeMath")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Elige la herramienta contable de tu interes"),
            const SizedBox(height: 10),
        
            Expanded(
              child: MasonryGridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: appMenuOptions.length,
                itemBuilder: (context, index) {
                  final option = appMenuOptions[index];
                
                  return Column(
                    children: [
                      if(index == 1) const SizedBox(height: 40),
                      _MenuOption(option: option),
                    ],
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  const _MenuOption({
    required this.option,
  });

  final Option option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/operations/${option.link}"),
      child: Container(
        width: 148,
        height: 206,
        decoration: BoxDecoration(
          color: const Color(0xFFFFDC62),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(option.icon),
            Text(option.name),
          ],
        ),
      )
    );
  }
}