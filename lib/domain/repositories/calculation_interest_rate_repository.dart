abstract class CalculationInterestRateRepository {
  Future<double> calculateSimpleInterestRate({
    required double capital,
    required double interest,
    required double time,
  });

  Future<double> calculateCompundInterestRate({
    required double amount,
    required double capital,
    required double interest,
    required double timeCapitalization,
  });
}