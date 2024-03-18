import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationAnnuitiesDatasourceImpl
    extends CalculationAnnuitiesDatasource {
  @override
  Future<double> calculateAmount({
    required double interestRate,
    required double annuityValue,
    required double time,
  }) async {
    final newInterestRate = interestRate / 100;
    final top =
        (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
    final amount = annuityValue * top;
    return amount;
  }

  @override
  Future<double> calculateInterestRate({
    required double amount,
    required double annuityValue,
    required double time,
  }) async {
    return 0;
  }

  @override
  Future<double> calculateAnnuityValue({
    required double amount,
    required double interestRate,
    required double time,
  }) async {
    final newInterestRate = interestRate / 100;
    final bottom =
        (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
    return amount / bottom;
  }

  @override
  Future<double> calculateTime({
    required double amount,
    required double annuityValue,
    required double interestRate,
  }) async {
    final newInterestRate = interestRate / 100;
    return log(1 + (newInterestRate * amount / annuityValue)) /
        log(1 + newInterestRate);
  }
}
