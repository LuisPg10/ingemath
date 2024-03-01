import 'package:flutter/material.dart';
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
      result = vp + (vp * (i / 100) * (d / 365));
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
            const DropdownMenuWidget(),
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

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({super.key});

  @override
  DropdownMenuWidgetState createState() => DropdownMenuWidgetState();
}

class DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  String _selectedItem = 'Monto Final';
  final List<String> _options = [
    'Monto Final',
    'Capital',
    'Intereses',
    'Tiempo',
    'Tasa de Interés'
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: DropdownButton<String>(
              value: _selectedItem,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                  _selectedIndex = _options.indexOf(_selectedItem);
                });
              },
              items: _options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        IndexedStack(
          index: _selectedIndex,
          children: [
            FormOption4(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
            FormOption4(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
            FormOption4(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
            FormOption4(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
            FormOption4(
              vpController: vpController,
              iController: iController,
              dController: dController,
            ),
          ],
        ),
      ],
    );
  }
}

class FormOption4 extends StatelessWidget {
  // final TextEditingController capitalController;
  final TextEditingController vpController;
  final TextEditingController iController;
  // final TextEditingController aController;
  final TextEditingController dController;

  const FormOption4({
    super.key,
    //  this.capitalController,
    required this.vpController,
    required this.iController,
    //  this.aController,
    required this.dController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text("Completa la Siguiente Información:"),
          TextFormField(
            // controller: capitalController,
            decoration: const InputDecoration(labelText: "Capital"),
          ),
          TextFormField(
            controller: vpController,
            decoration: const InputDecoration(labelText: "Valor Presente"),
          ),
          TextFormField(
            controller: iController,
            decoration: const InputDecoration(labelText: "Tasa de Interés"),
          ),
          const Text("Tiempo"),
          TextFormField(
            // controller: aController,
            decoration: const InputDecoration(labelText: "Años"),
          ),
          TextFormField(
            controller: dController,
            decoration: const InputDecoration(labelText: "Días"),
          ),
        ],
      ),
    );
  }
}

class FormFieldText extends StatelessWidget {
  final String texto;

  const FormFieldText({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: texto),
    );
  }
}
