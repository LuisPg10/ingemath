import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationAnnuitiesDatasourceImpl extends CalculationAnnuitiesDatasource {
  @override
  Future<double> calculateAmount({
    required int interestRate,
    required double annuityValue,
    required double time,
  }) async {

    final newInterestRate = interestRate / 100;
    double top = (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
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
    required int interestRate,
    required double time,
  }) async {

    final newInterestRate = interestRate / 100;
    double bottom = (pow((1 + newInterestRate), time).toDouble() - 1) / newInterestRate;
    final currentAnnuity = amount / bottom;
    return currentAnnuity;
  }

  @override
  Future<double> calculateTime({
    required double amount,
    required double annuityValue,
    required int interestRate,
  }) async {
    return 0;
  }
}
