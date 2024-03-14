enum CapitalizationPeriod {
  none,
  diario,
  semanal,
  mensual,
  trimestral,
  cuatrimestral,
  semestral,
  anual
}

// extension CapitalizationPeriodExtension on CapitalizationPeriod {
//   void calculateCap() {
//     final CapitalizationPeriod variable;
//     // double effectiveInterestRate;
//     int periodsPerYear;
//     switch (variable) {
//       case CapitalizationPeriod.diario:
//         periodsPerYear = 365;
//         break;
//       case CapitalizationPeriod.semanal:
//         periodsPerYear = 52;
//         break;
//       case CapitalizationPeriod.mensual:
//         periodsPerYear = 12;
//         break;
//       case CapitalizationPeriod.trimestral:
//         periodsPerYear = 4;
//         break;
//       case CapitalizationPeriod.cuatrimestral:
//         periodsPerYear = 3;
//         break;
//       case CapitalizationPeriod.semestral:
//         periodsPerYear = 2;
//         break;
//       case CapitalizationPeriod.anual:
//       default:
//         periodsPerYear = 1;
//     }
//     variable = variable.copyWith(periodsPerYear);
//   }
// }
