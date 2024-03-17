import 'package:ingemath/domain/domain.dart';

double formulaTiempo(int M4, int M5, int M6, int M7, int M8, int M9, CapitalizationPeriod capitalizationPeriod) {
  double tiempo = 0;

  final Map<CapitalizationPeriod, Map<String, dynamic>> formulas = {
    CapitalizationPeriod.anual: {
      "B4": 1.00,
      "C4": 1 / 12,
      "D4": 1 / 360,
      "E4": 1 / 6,
      "F4": 1 / 4,
      "G4": 1 / 2
    },
    CapitalizationPeriod.mensual: {
      "B5": 12.00,
      "C5": 1.00,
      "D5": 1 / 30,
      "E5": 2.00,
      "F5": 3.00,
      "G5": 6.00
    },
    CapitalizationPeriod.semestral: {
      "B6": 2,
      "C6": 1 / 6,
      "D6": 1 / 180,
      "E6": 1 / 3,
      "F6": 1 / 2,
      "G6": 1
    },
    CapitalizationPeriod.trimestral: {
      "B7": 4.00,
      "C7": 1 / 3,
      "D7": 1 / 80,
      "E7": 2 / 3,
      "F7": 1,
      "G7": 2
    },
    CapitalizationPeriod.bimestral: {
      "B8": 6,
      "C8": 1 / 2,
      "D8": 1 / 60,
      "E8": 1,
      "F8": 3 / 2,
      "G8": 3.00
    }
  };

  final Map<String, dynamic>? selectedFormula = formulas[capitalizationPeriod];

  if (selectedFormula != null) {
    tiempo = ((selectedFormula["B4"] * M4) +
        (selectedFormula["C4"] * M5) +
        (selectedFormula["D4"] * M6) +
        (selectedFormula["E4"] * M7) +
        (selectedFormula["F4"] * M8) +
        (selectedFormula["G4"] * M9));
  }

  return tiempo;
}
