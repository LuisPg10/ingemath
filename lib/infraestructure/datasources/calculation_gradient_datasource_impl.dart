import 'dart:math';
import '../../domain/domain.dart';

class CalculationGradientDatasourceImpl extends CalculationGradientDatasource {
  // GRADIENTE ARITMETICO

  // CRECIENTE
  @override
  Future<double> calculateGradientAIncreasingVP(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;
    double numerador = 1 - pow((1 + interes), -numPeriod).toDouble();
    double denominador = pow((1 + interes), numPeriod).toDouble();

    double termino1 = (paymentSeries * (numerador / interes));
    double termino2 = ((variationG / interes) *
        ((numerador / interes) - (numPeriod / (denominador))));

    double valorPresent = termino1 + termino2;
    return valorPresent;
  }

  @override
  Future<double> calculateGradientAIncreasingVF(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;

    double numerador = (pow((1 + interes), numPeriod).toDouble()) - 1;

    double termino1 = (paymentSeries * (numerador / interes));
    double termino2 =
        ((variationG / interes) * ((numerador / interes) - (numPeriod)));

    double valorFuture = termino1 + termino2;
    return valorFuture;
  }

// DECRECIENTE
  @override
  Future<double> calculateGradientADecreasingVP(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;

    double numerador = 1 - pow((1 + interes), -numPeriod).toDouble();
    double denominador = pow((1 + interes), numPeriod).toDouble();

    double termino1 = (paymentSeries * (numerador / interes));
    double termino2 = ((variationG / interes) *
        ((numerador / interes) - (numPeriod / (denominador))));

    double valorPresent = termino1 + termino2;
    return valorPresent;
  }

  @override
  Future<double> calculateGradientADecreasingVF(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;

    double numerador = (pow((1 + interes), numPeriod).toDouble()) - 1;

    double termino1 = (paymentSeries * (numerador / interes));
    double termino2 =
        ((variationG / interes) * ((numerador / interes) - (numPeriod)));

    double valorFuture = termino1 + termino2;
    return valorFuture;
  }

  // GRADIENTE ARITMETICO

  // CRECIENTE
  @override
  Future<double> calculateGradientGIncreasingVP(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;
    double variation = variationG / 100;

    double terminoExp1 = pow((1 + variation), numPeriod).toDouble();
    double terminoExp2 = pow((1 + interes), -numPeriod).toDouble();

    double numerador = (paymentSeries * (terminoExp1*terminoExp2 - 1));
    double denominador = variation - interes;

    double valorPresent = numerador / denominador;
    return valorPresent;
  }

  @override
  Future<double> calculateGradientGIncreasingVF(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {

    double interes = interestRate / 100;
    double variation = variationG / 100;
    
    double terminoExp1 = pow((1 + variation), numPeriod).toDouble();
    double terminoExp2 = pow((1 + interes), numPeriod).toDouble();

    double numerador = (paymentSeries * (terminoExp1 - terminoExp2));
    double denominador = variation - interes;

    double valorFuture = numerador / denominador;
    return valorFuture;
  }

// DECRECIENTE
  @override
  Future<double> calculateGradientGDecreasingVP(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;
    double variation = variationG / 100;

    double terminoExp1 = pow((1 - variation), numPeriod).toDouble();
    double terminoExp2 = pow((1 + interes), -numPeriod).toDouble();

    double numerador = (paymentSeries * ((terminoExp1 * terminoExp2) - 1));
    double denominador = variation + interes;

    double valorPresent = numerador / denominador;
    return valorPresent;
  }

  @override
  Future<double> calculateGradientGDecreasingVF(
      {required double paymentSeries,
      required double variationG,
      required double interestRate,
      required double numPeriod}) async {
    double interes = interestRate / 100;
    double variation = variationG / 100;

    double terminoExp1 = pow((1 - variation), numPeriod).toDouble();
    double terminoExp2 = pow((1 + interes), numPeriod).toDouble();

    double numerador = (paymentSeries * (terminoExp1 - terminoExp2));
    double denominador = variation + interes;

    double valorFuture = numerador / denominador;
    return valorFuture;
  }
}
