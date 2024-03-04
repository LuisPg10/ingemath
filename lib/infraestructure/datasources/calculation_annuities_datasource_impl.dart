import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationAnnuitiesDatasourceImpl extends CalculationAnnuitiesDatasource {
  @override
  Future<double> calculateAmount({
    required double annuityRate,
    required double currentAnnuity,
    required int currentValue,
  }) async {

    double top = (pow((1 + annuityRate), currentValue).toDouble() - 1) / annuityRate;
    final result = currentAnnuity * top;
    return result.truncateToDouble();
  }

  @override
  Future<double> calculateAnnuityRate({
    required double amount,
    required double currentAnnuity,
    required int currentValue,
  }) {
    // TODO: implement calculateAnnuityRate
    throw UnimplementedError();
  }

  @override
  Future<double> calculateCurrentAnnuity({
    required double amount,
    required double annuityRate,
    required int currentValue,
  }) {
    // TODO: implement calculateCurrentAnnuity
    throw UnimplementedError();
  }

  @override
  Future<double> calculateCurrentValue({
    required double amount,
    required double currentAnnuity,
    required double annuityRate,
  }) {
    // TODO: implement calculateCurrentValue
    throw UnimplementedError();
  }
}
