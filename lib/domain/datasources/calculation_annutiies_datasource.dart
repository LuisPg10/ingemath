abstract class CalculationAnnuitiesDatasource {
  Future<double> calculateAmount({
    required double annuityRate,
    required double currentAnnuity,
    required int currentValue,
  });

  Future<double> calculateAnnuityRate({
    required double amount,
    required double currentAnnuity,
    required int currentValue,
  });

  Future<double> calculateCurrentValue({
    required double amount,
    required double currentAnnuity,
    required double annuityRate,
  });

  Future<double> calculateCurrentAnnuity({
    required double amount,
    required double annuityRate,
    required int currentValue,
  });
}
