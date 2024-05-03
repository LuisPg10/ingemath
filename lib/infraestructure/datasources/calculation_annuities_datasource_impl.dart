import 'dart:math';

import '../../domain/domain.dart';

class CalculationAnnuitiesDatasourceImpl
    extends CalculationAnnuitiesDatasource {
  @override
  Future<double> calculateFinalValue({
    required double annuityRate,
    required double annuityValue,
    required double time,
  }) async {
    final newInterestRate = annuityRate / 100;
    final top =
        (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
    final amount = annuityValue * top;
    return double.parse(amount.toStringAsFixed(2));
  }

  @override
  Future<double> calculateCurrentValue({
    required double annuityValue,
    required double annuityRate,
    required double time,
  }) async {
    final newInterestRate = annuityRate / 100;
    final bottom = (1 - pow(1 + newInterestRate, -time)) / newInterestRate;

    return double.parse((annuityValue * bottom).toStringAsFixed(2));
  }

  @override
  Future<double> calculateAnnuityValue({
    required double amount,
    required double annuityRate,
    required double time,
  }) async {
    final newInterestRate = annuityRate / 100;
    final top =
        (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
    final annuity = amount / top;
    return double.parse(annuity.toStringAsFixed(2));
  }

  @override
  Future<double> calculateAnnuityRate({
    required double amount,
    required double annuityValue,
    required double time,
  }) async {
    return 0;
  }

  @override
  Future<double> calculateTime({
    required double amount,
    required double annuityValue,
    required double annuityRate,
  }) async {
    final newInterestRate = annuityRate / 100;
    return log(1 + (newInterestRate * amount / annuityValue)) /
        log(1 + newInterestRate);
  }
}
