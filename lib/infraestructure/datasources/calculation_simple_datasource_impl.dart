import 'package:ingemath/domain/datasources/datasources.dart';

class CalculationSimpleDatasourceImpl extends CalculationSimpleDatasource {
  @override
  Future<double> capital({
    required double interest,
    required int rateInterest,
    required double time,
  }) async {
    return (interest / ((rateInterest / 100) * time));
  }

  @override
  Future<double> capitalWithAmount({
    required double amount,
    required int rateInterest,
    required double time,
  }) async {
    return (amount / (1 + ((rateInterest / 100) * time)));
  }

  @override
  Future<double> finalAmount(
      {required double capital,
      required int rateInterest,
      required double time}) async {
    return capital + (capital * (rateInterest / 100) * (time / 360));
  }

  @override
  Future<double> finalAmountWithInterst({
    required double capital,
    required double interest,
  }) async {
    return capital + interest;
  }

  @override
  Future<double> interest({
    required double capital,
    required int rateInterest,
    required double time,
  }) async {
    return capital * (rateInterest / 100) * time;
  }

  @override
  Future<double> interestWithAmount({
    required double capital,
    required double amount,
  }) async {
    return amount - capital;
  }

  @override
  Future<double> rateInterest({
    required double capital,
    required double interest,
    required double time,
  }) async {
    return (interest / (capital * time));
  }

  @override
  Future<double> rateInterestWithAmount({
    required double capital,
    required double amount,
    required double time,
  }) async {
    return ((amount - capital) / (capital * time));
  }

  @override
  Future<double> time({
    required double capital,
    required double interest,
    required int rateInterest,
  }) async {
    return (interest / (capital * (rateInterest / 100)));
  }

  @override
  Future<double> timeWithAmount({
    required double capital,
    required double amount,
    required int rateInterest,
  }) async {
    return ((amount - capital) / (capital * (rateInterest / 100)));
  }
}
