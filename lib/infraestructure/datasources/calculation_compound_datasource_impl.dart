import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationCompoundDatasourceImpl extends CalculationCompoundDatasource {
  @override
  Future<double> calculateAmountComp({
      required double capital,
      required double capInterestRate,
      required double time
  }) async {

    double amountCompound = (capital * (pow(1 + capInterestRate, time)));
    return amountCompound;
  }

  @override
  Future<double> calculateCapitalComp(
      {required double amount,
      required double capInterestRate,
      required double time}) {
   
    throw UnimplementedError();
  }

  @override
  Future<double> calculateInterestRate(
      {required double amount, required double capital, required double time}) {
   
    throw UnimplementedError();
  }

  @override
  Future<double> calculatePresentValue(
      {required double amount,
      required double interestRateCap,
      required double time}) {
    
    throw UnimplementedError();
  }

  @override
  Future<double> calculateTimeComp(
      {required double amount,
      required double capital,
      required double capInterestRate}) {
    
    throw UnimplementedError();
  }
}
