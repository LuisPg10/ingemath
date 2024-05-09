import 'package:flutter/material.dart';
import 'package:ingemath/presentation/widgets/shared/close_icon.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final bool showArrow;
  final bool showLogo;
  final double height;

  const CustomBackground({
    super.key,
    required this.child,
    this.showArrow = false,
    this.showLogo = false,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.topRight, child: _CustomLines(height)),
          Align(
            alignment: Alignment.bottomLeft,
            child: Transform.flip(
              flipX: true,
              flipY: true,
              child: _CustomLines(height),
            ),
          ),
          if (showArrow)
            const CloseIcon(
              navigation: "/login",
              icon: Icons.close_rounded,
              alignment: 320,
            ),
          child,
        ],
      ),
    );
  }
}

class _CustomLines extends StatelessWidget {
  final double heightLines;

  const _CustomLines(this.heightLines);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/custom/custom-lines.png",
      height: heightLines,
    );
  }
}
