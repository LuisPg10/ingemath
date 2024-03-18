abstract class CalculationInterestRateDatasource {
  Future<double> calculateSimpleInterestRate({
    required double capital,
    required double interest,
    required double time,
  });

  Future<double> calculateCompundInterestRate({
    required double capital,
    required double amount,
    required double interest,
    required double timeCapitalization,
  });
}