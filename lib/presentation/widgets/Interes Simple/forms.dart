import 'package:flutter/material.dart';

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
            controller: vpController,
            decoration:
                const InputDecoration(labelText: "Capital o Valor Presente"),
          ),
          TextFormField(
            controller: iController,
            decoration: const InputDecoration(labelText: "Tasa de Interés (%)"),
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
