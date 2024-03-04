import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

class CalculationCompoundRepositoryImpl extends CalculationCompoundRepository {
  final CalculationCompoundDatasource datasource;

  CalculationCompoundRepositoryImpl({CalculationCompoundDatasource? datasource})
      : datasource = datasource ?? CalculationCompoundDatasourceImpl();

  @override
  Future<double> calculateAmountComp({
    required double capital,
    required double capInterestRate,
    required double time
  }) {
    return datasource.calculateAmountComp(
      capital: capital, 
      capInterestRate: capInterestRate, 
      time: time
    );
  }

  @override
  Future<double> calculateCapitalComp({
    required double amount,
    required double capInterestRate,
    required double time
  }) {
    return datasource.calculateCapitalComp(
      amount: amount, 
      capInterestRate: capInterestRate, 
      time: time
      );
  }

  @override
  Future<double> calculateInterestRate({
    required double amount, 
    required double capital, 
    required double time
  }) {
    return datasource.calculateInterestRate(
      amount: amount, 
      capital: capital, 
      time: time
      );
  }

  @override
  Future<double> calculatePresentValue({
    required double amount,
    required double interestRateCap,
    required double time
  }) {
    return datasource.calculatePresentValue(
      amount: amount, 
      interestRateCap: interestRateCap, 
      time: time
    );
  }

  @override
  Future<double> calculateTimeComp({
    required double amount,
    required double capital,
    required double capInterestRate
  }) {
    return datasource.calculateTimeComp(
      amount: amount,  
      capital: capital, 
      capInterestRate: capInterestRate
    );
  }
}
