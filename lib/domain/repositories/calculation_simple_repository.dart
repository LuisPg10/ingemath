abstract class CalculationSimpleRepository {
  Future<double> capital({
    required double interest,
    required int rateInterest,
    required double time,
  });

  Future<double> capitalWithAmount({
    required double amount,
    required int rateInterest,
    required double time,
  });

  Future<double> finalAmount({
    required double capital,
    required int rateInterest,
    required double time,
  });

  Future<double> finalAmountWithInterst({
    required double capital,
    required double interest,
  });

  Future<double> rateInterest({
    required double interest,
    required double capital,
    required double time,
  });

  Future<double> rateInterestWithAmount({
    required double amount,
    required double capital,
    required double time,
  });

  Future<double> time({
    required double capital,
    required double interest,
    required int rateInterest,
  });

  Future<double> timeWithAmount({
    required double amount,
    required double capital,
    required int rateInterest,
  });

  Future<double> interest({
    required double capital,
    required int rateInterest,
    required double time,
  });

  Future<double> interestWithAmount({
    required double capital,
    required double amount,
  });
}
