abstract class CalculationCompoundDatasource {
  Future<double> calculateAmountComp({
    required double capital,
    required double capInterestRate,
    required double time,
  });
  
  Future<double> calculateInterestRate({
    required double amount,
    required double capital,
    required double time,
  });

  Future<double> calculateCapitalComp({
    required double amount,
    required double capInterestRate,
    required double time,
  });

    Future<double> calculateTimeComp({
    required double amount,
    required double capital,
    required double capInterestRate,
  });
}
