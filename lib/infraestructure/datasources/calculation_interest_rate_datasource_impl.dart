import 'dart:math';

import 'package:ingemath/domain/domain.dart';

class CalculationInterestRateDatasourceImpl
    extends CalculationInterestRateDatasource {
  @override
  Future<double> calculateCompundInterestRate({
    required double amount,
    required double capital,
    required double interest,
    required double timeCapitalization,
  }) async {

    return pow(amount / capital, 1 / timeCapitalization) - 1;

  }

  @override
  Future<double> calculateSimpleInterestRate({
    required double capital,
    required double interest,
    required double time,
  }) async {

    return interest / (capital * time);

  }
}
