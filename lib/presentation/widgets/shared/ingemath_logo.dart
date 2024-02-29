import 'package:flutter/material.dart';

class IngeMathLogo extends StatelessWidget {

  final double size;

  const IngeMathLogo({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 2.2,
      child: Row(
        children: [
          _Lines(size),
          _CustomIcon(size: size),
          Transform.flip(flipX: true, child: _Lines(size)),
        ],
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: size * 0.1,
          color: const Color(0xFFFF833D),
        ),
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(Icons.monetization_on, color: Colors.green, size: size * 0.8),
    );
  }
}

//* Lines horizontal
class _Lines extends StatelessWidget {

  final double size;
  
  const _Lines(this.size);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size * 0.6, size / 2),
      painter: _LinesPainter(),
    );
  }
}

//* How do lines horizontal
class _LinesPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = const Color(0xFFFF833D)
      ..style = PaintingStyle.fill;

    double height = size.height / 7;

    final path = Path();

    _createMultiLines(size, path, height);

    canvas.drawPath(path, paint);
  }

  //* Recursive Line creation
  void _createMultiLines( Size size, Path path, double height, [int i = 0, int j = 1]) {
    
    path.moveTo(size.width * (i * 0.2), height * (i * 2));

    path.lineTo(size.width, height * (i * 2));
    path.lineTo(size.width, height * (j));
    path.lineTo(size.width * ( j * 0.1), height * (j));

    if(i <= 2) _createMultiLines(size, path, height, i + 1, j + 2);
  }

  @override
  bool shouldRepaint(_LinesPainter oldDelegate) => false;
}