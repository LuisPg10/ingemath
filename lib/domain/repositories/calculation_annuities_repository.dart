abstract class CalculationAnnuitiesRepository {
  Future<double> calculateAmount({
    required double annuityValue,
    required double interestRate,
    required double time,
  });

  Future<double> calculateInterestRate({
    required double amount,
    required double annuityValue,
    required double time,
  });

  Future<double> calculateTime({
    required double amount,
    required double annuityValue,
    required double interestRate,
  });

  Future<double> calculateAnnuityValue({
    required double amount,
    required double interestRate,
    required double time,
  });
}
