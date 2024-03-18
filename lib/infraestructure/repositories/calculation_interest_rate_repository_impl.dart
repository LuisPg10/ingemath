import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

class CalculationInterestRateRepositoryImpl
    extends CalculationInterestRateRepository {
  final CalculationInterestRateDatasource datasource;

  CalculationInterestRateRepositoryImpl(
      {CalculationInterestRateDatasource? datasource}
  ) : datasource = datasource ?? CalculationInterestRateDatasourceImpl();

  @override
  Future<double> calculateCompundInterestRate({
    required double amount,
    required double capital,
    required double interest,
    required double timeCapitalization,
  }) async {
    return datasource.calculateCompundInterestRate(
      capital: capital,
      amount: amount,
      interest: interest,
      timeCapitalization: timeCapitalization,
    );
  }

  @override
  Future<double> calculateSimpleInterestRate({
    required double capital,
    required double interest,
    required double time,
  }) async {
    return datasource.calculateSimpleInterestRate(
      capital: capital,
      interest: interest,
      time: time,
    );
  }
}
