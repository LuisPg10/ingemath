import 'package:ingemath/domain/domain.dart';

class CalCulationTirDatasourceImpl extends CalculationTirDatasource {
  @override
  Future<double> calculateTIR({
    required double investment,
    required List<double> cashflow,
  }) async {
    return 1;
  }

  @override
  Future<double> calculateVAN({
    required double investment,
    required double tir,
    required List<double> cashflow,
  }) async {
    return 2;
  }

  @override
  Future<double> calculateinvestment({
    required double van,
    required double tir,
    required List<double> cashflow,
  }) async {
    return 3;
  }
}
