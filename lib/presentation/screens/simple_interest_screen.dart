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

  void calculateResult() {
    double vp = double.tryParse(vpController.text) ?? 0;
    double i = double.tryParse(iController.text) ?? 0;
    double d = double.tryParse(dController.text) ?? 0;

    setState(() {
      // Calcular el resultado usando la fórmula de interés simple
      result = vp + (vp * (i / 100) * (d / 360));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de \n Interés Simple"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Selecciona Variable a Calcular"),
            DropdownMenuWidget(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
            const SizedBox(height: 20),
            CustomFilledButton(
              buttonColor: Colors.grey,
              onPressed: () {
                calculateResult();
              },
              child: const Text("Calcular", style: TextStyle(fontSize: 24)),
            ),
            if (result != null)
              Text(
                "Resultado: ${result?.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
