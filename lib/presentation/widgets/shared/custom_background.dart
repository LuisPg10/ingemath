import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(alignment: Alignment.topRight, child: _CustomLines()),
          Align(
            alignment: Alignment.bottomLeft,
            child: Transform.flip(
                flipX: true, flipY: true, child: const _CustomLines()),
          ),
          child
        ],
      ),
    );
  }
}

class _CustomLines extends StatelessWidget {
  const _CustomLines();

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/custom/custom-lines.png");
  }
}
