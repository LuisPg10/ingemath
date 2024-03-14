import 'package:ingemath/domain/datasources/datasources.dart';

class TimeResult {
  final int years;
  final int months;
  final int weeks;
  final int days;

  TimeResult({
    required this.years,
    required this.months,
    required this.weeks,
    required this.days,
  });
}

class CalculationSimpleDatasourceImpl extends CalculationSimpleDatasource {
  //Calcular Capital, tasa de interes se recibe como % y el tiempo en Años.
  @override
  Future<double> capital({
    required double interest,
    required int rateInterest,
    required double time,
  }) async {
    double result = (interest / ((rateInterest / 100) * time));
    return double.parse(result.toStringAsFixed(2));
  }

  @override
  Future<double> capitalWithAmount({
    required double amount,
    required int rateInterest,
    required double time,
  }) async {
    return (amount / (1 + ((rateInterest / 100) * time)));
  }

  //Calcular Monto, tasa de interes se recibe como % y el tiempo en Años.
  @override
  Future<double> finalAmount(
      {required double capital,
      required int rateInterest,
      required double time}) async {
    double result = capital * (1 + (rateInterest / 100) * time);
    return double.parse(result.toStringAsFixed(2));
  }

  @override
  Future<double> finalAmountWithInterst({
    required double capital,
    required double interest,
  }) async {
    return capital + interest;
  }

  //Calcular Interes, tasa de interes se recibe como % y el tiempo en Años.
  @override
  Future<double> interest({
    required double capital,
    required int rateInterest,
    required double time,
  }) async {
    double result = capital * (rateInterest / 100) * time;
    return double.parse(result.toStringAsFixed(2));
  }

  @override
  Future<double> interestWithAmount({
    required double capital,
    required double amount,
  }) async {
    return amount - capital;
  }

  //Calcular Tasa de Interest, tiempo se recibe en Años.
  @override
  Future<double> rateInterest({
    required double capital,
    required double interest,
    required double time,
  }) async {
    double result = (interest / (capital * time)) * 100;
    return double.parse(result.toStringAsFixed(2));
  }

  @override
  Future<double> rateInterestWithAmount({
    required double capital,
    required double amount,
    required double time,
  }) async {
    return ((amount - capital) / (capital * time));
  }

  //Calcular Tiempo, tasa de interes se recibe como %
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
