import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationCompoundDatasourceImpl extends CalculationCompoundDatasource {
  @override
  Future<double> calculateAmountComp(
      {required double capital,
      required int capInterestRate,
      required double time}) async {

    // double amountResult = 
    // final result = amountResult;
    return capital * (pow(1 + capInterestRate.toDouble(), time));
  }

  @override
  Future<double> calculateCapitalComp(
      {required double amount,
      required int capInterestRate,
      required double time
    }) async {
      double capitalResult = amount * (pow(1 + capInterestRate.toDouble(), time));
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
      required int capInterestRate
      }) async {

      double timeResult = (log(amount)-log(capital) / log( 1 + capInterestRate.toDouble()));
      final result = double.parse(timeResult.toStringAsFixed(3));  
      return result;
  }
}
