import 'package:ingemath/domain/datasources/datasources.dart';
import 'package:ingemath/domain/repositories/repositories.dart';
import 'package:ingemath/infraestructure/datasources/calculation_tir_datasource_impl.dart';

class CalculationTirRepositoryImpl extends CalculationTirRepository {
  final CalculationTirDatasource datasource;

  CalculationTirRepositoryImpl({CalculationTirDatasource? datasource})
      : datasource = datasource ?? CalCulationTirDatasourceImpl();

  @override
  Future<double> calculateTIR({
    required double investment,
    required List<double> cashflow,
  }) {
    return datasource.calculateTIR(investment: investment, cashflow: cashflow);
  }

  @override
  Future<double> calculateVAN({
    required double investment,
    required double tir,
    required List<double> cashflow,
  }) {
    return datasource.calculateVAN(investment: investment, tir: tir, cashflow: cashflow);
  }

  @override
  Future<double> calculateInvestment({
    required double van,
    required double tir,
    required List<double> cashflow,
  }) {
    return datasource.calculateinvestment(van: van, tir: tir, cashflow: cashflow);
  }
}
