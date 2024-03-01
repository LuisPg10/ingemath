import 'package:flutter/material.dart';
import 'package:ingemath/presentation/widgets/Interes%20Simple/dropdown_menu.dart';
import 'package:ingemath/presentation/widgets/shared/custom_filled_button.dart';

final TextEditingController vpController = TextEditingController();
final TextEditingController iController = TextEditingController();
final TextEditingController dController = TextEditingController();

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  SimpleInterestScreenState createState() => SimpleInterestScreenState();
}

class SimpleInterestScreenState extends State<SimpleInterestScreen> {
  double? result;

  void calculateFinalAmount() {
    double vp = double.tryParse(vpController.text) ?? 0;
    double i = double.tryParse(iController.text) ?? 0;
    double d = double.tryParse(dController.text) ?? 0;

    setState(() {
      result = vp + (vp * (i / 100) * (d / 360));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interés Simple"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFFFDC62),
        ),
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              DropdownMenuWidget(
                vpController: vpController,
                iController: iController,
                dController: dController,
              ),
              const SizedBox(height: 20),
              CustomFilledButton(
                buttonColor: const Color(0xFF218C1E),
                onPressed: () {
                  calculateFinalAmount();
                },
                child: const Text("CALCULAR",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    )),
              ),
              if (result != null)
                Text(
                  "Resultado: ${result?.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
