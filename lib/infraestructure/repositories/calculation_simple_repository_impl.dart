import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

class CalculationSimpleRepositoryImpl extends CalculationSimpleRepository {
  final CalculationSimpleDatasource datasource;

  CalculationSimpleRepositoryImpl(
    {CalculationSimpleDatasource? datasource}
  ) : datasource = datasource ?? CalculationSimpleDatasourceImpl();

  @override
  Future<double> capital({
    required double interest,
    required double rateInterest,
    required double time,
  }) {
    return datasource.capital(
      interest: interest,
      rateInterest: rateInterest,
      time: time,
    );
  }

  @override
  Future<double> capitalWithAmount({
    required double amount,
    required double rateInterest,
    required double time,
  }) {
    return datasource.capitalWithAmount(
      amount: amount,
      rateInterest: rateInterest,
      time: time,
    );
  }

  @override
  Future<double> finalAmount({
    required double capital,
    required double rateInterest,
    required double time,
  }) {
    return datasource.finalAmount(
      capital: capital,
      rateInterest: rateInterest,
      time: time,
    );
  }
}
