import 'package:ingemath/domain/datasources/datasources.dart';

class CalculationSimpleDatasourceImpl extends CalculationSimpleDatasource{
  @override
  Future<double> capital({
    required double interest,
    required double rateInterest,
    required double time
  }) {
    // TODO: implement capital
    throw UnimplementedError();
  }

  @override
  Future<double> capitalWithAmount({required double amount, required double rateInterest, required double time}) {
    // TODO: implement capitalWithAmount
    throw UnimplementedError();
  }

  @override
  Future<double> finalAmount({
    required double capital,
    required double rateInterest,
    required double time
  }) async {
    return capital + (capital * (rateInterest / 100) * (time / 360));
  }

}