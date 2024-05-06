import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:ingemath/presentation/widgets/shared/custom_background.dart';
import 'package:ingemath/presentation/widgets/shared/header.dart';
import '../../config/menu/operation_options.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      height: 180,
      showArrow: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 40),
            const Text(
              "Bienvenidos a IngeMath",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Elige la herramienta contable de tu \ninteres !",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
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
                    if (index == 1) const SizedBox(height: 40),
                    _MenuOption(option: option),
                  ],
                );
              },
            ))
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
        ));
  }
}
