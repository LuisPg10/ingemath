import 'package:flutter/material.dart';

class Flecha extends StatelessWidget {
  const Flecha({
    super.key,
    required this.navigation,
    required this.icon,
    required this.alignment,
  });

  final String navigation;
  final IconData icon;
  final double alignment;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 760,
        left: alignment,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: screenWidth * 0.1,
        ),
      ),
    );
  }
}
