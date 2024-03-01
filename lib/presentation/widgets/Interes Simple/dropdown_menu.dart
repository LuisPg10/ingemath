// dropdown_menu_widget.dart

import 'package:flutter/material.dart';
import 'package:ingemath/presentation/widgets/Interes%20Simple/forms.dart';

class DropdownMenuWidget extends StatefulWidget {
  final TextEditingController vpController;
  final TextEditingController iController;
  final TextEditingController dController;

  const DropdownMenuWidget({
    Key? key,
    required this.vpController,
    required this.iController,
    required this.dController,
  }) : super(key: key);

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
        const Center(child: Text("Selecciona Variable a Calcular")),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: DropdownButton<String>(
              value: _selectedItem,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              iconEnabledColor: Colors.black,
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              vpController: widget.vpController,
              iController: widget.iController,
              dController: widget.dController,
            ),
            FormOption4(
              vpController: widget.vpController,
              iController: widget.iController,
              dController: widget.dController,
            ),
            FormOption4(
              vpController: widget.vpController,
              iController: widget.iController,
              dController: widget.dController,
            ),
            FormOption4(
              vpController: widget.vpController,
              iController: widget.iController,
              dController: widget.dController,
            ),
            FormOption4(
              vpController: widget.vpController,
              iController: widget.iController,
              dController: widget.dController,
            ),
          ],
        ),
      ],
    );
  }
}
