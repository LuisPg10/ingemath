import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CompoundInterestScreen extends StatelessWidget {
  const CompoundInterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULADORA DE INTERES C.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),),
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Interes Compuesto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Selecciona Variable a Calcular',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              // Agrega el DropdownButton debajo del texto
              DropdownButton<String>(
                items: [
                  'Capital',
                  'Monto Compu',
                  'Interes Compu'
                ] // Reemplaza con tus opciones
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Puedes agregar lógica aquí cuando se selecciona una opción
                },
                hint: const Text(
                    'Selecciona una opción'), // Texto antes de seleccionar
                value:
                    null, // Deberías mantener un estado para la opción seleccionada
              ),
              const SizedBox(height: 30),
              const Text(
                'Completa la siguiente Informacion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 163, 3, 3),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.amber[300],
                  child: Column(
                    children: [
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Capital',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Valor Presente',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Tasa de Interes',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tiempo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 163, 3, 3),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Diario',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Trimestral',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Semestral',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Anual',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                            onPressed: () {
                              // 
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 114, 46),
                              minimumSize: const Size(double.infinity, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Bordes circulares
                              ),
                            ),
                            child: const Text('CALCULAR',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        TextField(
                        controller: null,
                        decoration: InputDecoration(
                          labelText: 'Resultado',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical:100, horizontal: 5),
                        ),
                        style: const TextStyle(fontSize: 15),
                      ),  
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
