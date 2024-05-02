import '../../domain/domain.dart';
import '../infraestructure.dart';

class CalculationAnnuitiesRepositoryImpl
    extends CalculationAnnuitiesRepository {
  final CalculationAnnuitiesDatasource datasource;

  CalculationAnnuitiesRepositoryImpl(
      {CalculationAnnuitiesDatasource? datasource})
      : datasource = datasource ?? CalculationAnnuitiesDatasourceImpl();

  @override
  Future<double> calculateAmount({
    required double interestRate,
    required double annuityValue,
    required double time,
  }) {
    return datasource.calculateAmount(
      interestRate: interestRate,
      annuityValue: annuityValue,
      time: time,
    );
  }

  @override
  Future<double> calculateInterestRate({
    required double amount,
    required double annuityValue,
    required double time,
  }) {
    return datasource.calculateInterestRate(
      amount: amount,
      annuityValue: annuityValue,
      time: time,
    );
  }

  @override
  Future<double> calculateAnnuityValue({
    required double amount,
    required double interestRate,
    required double time,
  }) {
    return datasource.calculateAnnuityValue(
      amount: amount,
      interestRate: interestRate,
      time: time,
    );
  }

  @override
  Future<double> calculateTime({
    required double amount,
    required double annuityValue,
    required double interestRate,
  }) {
    return datasource.calculateTime(
      amount: amount,
      annuityValue: annuityValue,
      interestRate: interestRate,
    );
  }
}
