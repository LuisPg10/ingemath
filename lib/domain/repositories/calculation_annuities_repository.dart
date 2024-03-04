abstract class CalculationAnnuitiesRepository {
  Future<double> calculateAmount({
    required double annuityValue,
    required int interestRate,
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
    required int interestRate,
  });

  Future<double> calculateAnnuityValue({
    required double amount,
    required int interestRate,
    required double time,
  });
}
