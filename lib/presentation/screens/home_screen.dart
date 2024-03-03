import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Spacer(flex: 5),

          const IngeMathLogo(size: 150),

          Text("INGEMATH",
            style: GoogleFonts.squadaOne().copyWith(
              fontSize: 60,
              fontWeight: FontWeight.normal,
              color: const Color(0xFFFF833D),
              letterSpacing: 10,
              height: 0
            ),
          ),

          Text("MONEY",
            style: GoogleFonts.squadaOne().copyWith(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF7ED957),
              letterSpacing: 3,
              height: 0
            ),
          ),

          const Spacer(flex: 2),

          SizedBox(
            height: 50,
            child: CustomFilledButton(
              buttonColor: const Color(0xFFFF833D),
              onPressed: () => context.push("/operations"),
              child: const Text("Ingresar", style: TextStyle(fontSize: 24)),
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
