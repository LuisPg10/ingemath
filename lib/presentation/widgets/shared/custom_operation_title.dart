import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOperationTitle extends StatelessWidget {
  const CustomOperationTitle({
    super.key,
    required this.title,
    required this.length,
  });

  final String title;
  final double length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat().copyWith(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: length,
          height: 4,
          child: Container(
            color: const Color(0xFFFF833D),
          ),
        ),
      ],
    );
  }
}
