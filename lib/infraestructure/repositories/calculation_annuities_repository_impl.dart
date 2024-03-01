import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

class CalculationAnnuitiesRepositoryImpl extends CalculationAnnuitiesRepository {
  final CalculationAnnuitiesDatasource datasource;

  CalculationAnnuitiesRepositoryImpl(
    {CalculationAnnuitiesDatasource? datasource}
  ) : datasource = datasource ?? CalculationAnnuitiesDatasourceImpl();

  @override
  Future<double> calculateAmount({
    required double annuityRate,
    required double currentAnnuity,
    required int currentValue,
  }) {
    return datasource.calculateAmount(
      annuityRate: annuityRate,
      currentAnnuity: currentAnnuity,
      currentValue: currentValue,
    );
  }

  @override
  Future<double> calculateAnnuityRate({
    required double amount,
    required double currentAnnuity,
    required int currentValue,
  }) {
    return datasource.calculateAnnuityRate(
      amount: amount,
      currentAnnuity: currentAnnuity,
      currentValue: currentValue,
    );
  }

  @override
  Future<double> calculateCurrentAnnuity({
    required double amount,
    required double annuityRate,
    required int currentValue,
  }) {
    return datasource.calculateCurrentAnnuity(
      amount: amount,
      annuityRate: annuityRate,
      currentValue: currentValue,
    );
  }

  @override
  Future<double> calculateCurrentValue({
    required double amount,
    required double currentAnnuity,
    required double annuityRate,
  }) {
    return datasource.calculateCurrentValue(
      amount: amount,
      currentAnnuity: currentAnnuity,
      annuityRate: annuityRate,
    );
  }
}
