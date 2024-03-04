import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationCompoundDatasourceImpl extends CalculationCompoundDatasource {
  @override
  Future<double> calculateAmountComp(
      {required double capital,
      required double capInterestRate,
      required double time}) async {
    double amountResult = capital * (pow(1 + capInterestRate, time));
    final result = double.parse(amountResult.toStringAsFixed(3));
    return result;
  }

  @override
  Future<double> calculateCapitalComp(
      {required double amount,
      required double capInterestRate,
      required double time
    }) async {
      double capitalResult = amount * (pow(1 + capInterestRate, time));
      final result = double.parse(capitalResult.toStringAsFixed(3));  
      return result;
  }

  @override
  Future<double> calculateInterestRate(
      {required double amount, 
      required double capital, 
      required double time
      }) async {
      
      double capitalResult = (pow(amount/capital, 1/(time-1)).toDouble());
      final result = double.parse(capitalResult.toStringAsFixed(3));  
      return result;
  }

  @override
  Future<double> calculateTimeComp(
      {required double amount,
      required double capital,
      required double capInterestRate
      }) async {

      double timeResult = (log(amount)-log(capital) / log( 1 + capInterestRate));
      final result = double.parse(timeResult.toStringAsFixed(3));  
      return result;
  }
}
