import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

class CalculationCompoundRepositoryImpl extends CalculationCompoundRepository {

  final CalculationCompoundDatasource datasource;

  CalculationCompoundRepositoryImpl(
    {CalculationCompoundDatasource? datasource}
    ): datasource = datasource ?? CalculationCompoundDatasourceImpl();

    

  @override
  Future<double> calculateAmountComp({
    required double capital,
    required double capInterestRate,
    required CapitalizationPeriod capitalizationPeriod,
    required double time
  }) {
    return datasource.calculateAmountComp(
      capital: capital, 
      capInterestRate: capInterestRate, 
      capitalizationPeriod: capitalizationPeriod,
      time: time
    );
  }

  @override
  Future<double> calculateCapitalComp({
    required double amount,
    required double capInterestRate,
    required CapitalizationPeriod capitalizationPeriod,
    required double time
  }) {
    return datasource.calculateCapitalComp(
      amount: amount, 
      capInterestRate: capInterestRate, 
      capitalizationPeriod: capitalizationPeriod,
      time: time
      );
  }

  @override
  Future<double> calculateInterestRate({
    required double amount, 
    required double capital, 
    required double time,
    required CapitalizationPeriod capitalizationPeriod,
  }) {
    return datasource.calculateInterestRate(
      amount: amount, 
      capital: capital, 
      time: time,
      capitalizationPeriod: capitalizationPeriod
      );
  }
    
  @override
  Future<double> calculateInterestRate2({
    required double amount, 
    required double capital}) {
    return datasource.calculateInterestRate2(
      amount: amount, 
      capital: capital, 
      );
  }
  
  @override
  Future<double> calculateTimeComp({
    required double amount,
    required double capital,
    required double capInterestRate,
    required CapitalizationPeriod capitalizationPeriod,
  }) {
    return datasource.calculateTimeComp(
      amount: amount,  
      capital: capital, 
      capInterestRate: capInterestRate,
      capitalizationPeriod: capitalizationPeriod,
    );
  }

  
}
