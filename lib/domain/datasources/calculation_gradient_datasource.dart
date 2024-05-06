
// 1. Arithmetic or Linear
//    Growing
//      Calculate Linear Increasing Present Value
abstract class CalculationGradientDatasource {
  Future<double> calculateLinearIncreasingPV({
    required double variationG,
    required double interestRate,
    required double numInstallments,
    required double time,
  });

 
}
