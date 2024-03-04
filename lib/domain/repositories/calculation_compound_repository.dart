abstract class CalculationCompoundRepository {
  Future<double> calculateAmountComp({
    required double capital,
    required int capInterestRate,
    required double time,
  });

  Future<double> calculateInterestRate({
    required double amount,
    required double capital,
    required double time,
  });

  Future<double> calculateCapitalComp({
    required double amount,
    required int capInterestRate,
    required double time,
  });

    Future<double> calculateTimeComp({
    required double amount,
    required double capital,
    required int capInterestRate,
  });
}