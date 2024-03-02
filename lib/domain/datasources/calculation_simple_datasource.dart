abstract class CalculationSimpleDatasource {
  Future<double> finalAmount({
    required double capital,
    required double rateInterest,
    required double time,
  });

  Future<double> capital({
    required double interest,
    required double rateInterest,
    required double time,
  });

  Future<double> capitalWithAmount({
    required double amount,
    required double rateInterest,
    required double time,
  });

  // TODO: implementar metodos
}
