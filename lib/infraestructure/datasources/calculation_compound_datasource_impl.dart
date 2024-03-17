import 'dart:math';

import 'package:ingemath/domain/domain.dart';


class CalculationCompoundDatasourceImpl extends CalculationCompoundDatasource {
  @override
  Future<double> calculateAmountComp(
      {required double capital,
      required double capInterestRate,
      required CapitalizationPeriod capitalizationPeriod,
      required double time}) async {
    
    double effectiveInterestRate;
    int periodsPerYear;

    switch (capitalizationPeriod) {
      case CapitalizationPeriod.diario:
        periodsPerYear = 365; 
        break;
      case CapitalizationPeriod.semanal:
        periodsPerYear = 52; 
        break;
      case CapitalizationPeriod.mensual:
        periodsPerYear = 12; 
        break;
      case CapitalizationPeriod.trimestral:
        periodsPerYear = 4; 
        break;
      case CapitalizationPeriod.cuatrimestral:
        periodsPerYear = 3; 
        break;
      case CapitalizationPeriod.semestral:
        periodsPerYear = 2; 
        break;
      case CapitalizationPeriod.anual:
      default:
        periodsPerYear = 1; 
    }

    effectiveInterestRate = (capInterestRate / 100) / periodsPerYear;
    double amountResult = capital * (pow(1 + effectiveInterestRate, (time*12)));
    final result = amountResult;
    return result;
  }

  @override
  Future<double> calculateCapitalComp(
      {required double amount,
      required double capInterestRate,
      required CapitalizationPeriod capitalizationPeriod,
      required double time}) async {
      double effectiveInterestRate;
    int periodsPerYear;

    switch (capitalizationPeriod) {
      case CapitalizationPeriod.diario:
        periodsPerYear = 365; 
        break;
      case CapitalizationPeriod.semanal:
        periodsPerYear = 52; 
        break;
      case CapitalizationPeriod.mensual:
        periodsPerYear = 12; 
        break;
      case CapitalizationPeriod.trimestral:
        periodsPerYear = 4; 
        break;
      case CapitalizationPeriod.cuatrimestral:
        periodsPerYear = 3; 
        break;
      case CapitalizationPeriod.semestral:
        periodsPerYear = 2; 
        break;
      case CapitalizationPeriod.anual:
      default:
        periodsPerYear = 1; 
    }

    effectiveInterestRate = (capInterestRate / 100) / periodsPerYear;
    double capitalResult =
        amount / (pow(1 + effectiveInterestRate, (time)));
    final result = double.parse(capitalResult.toStringAsFixed(3));
    return result;
  }


  @override
  Future<double> calculateInterestRate(
      {required double amount,
      required double capital,
       required CapitalizationPeriod capitalizationPeriod,
      required double time}) async {

        double effectiveInterestRate;
        int periodsPerYear;

    switch (capitalizationPeriod) {
      case CapitalizationPeriod.diario:
        periodsPerYear = 365; 
        break;
      case CapitalizationPeriod.semanal:
        periodsPerYear = 52; 
        break;
      case CapitalizationPeriod.mensual:
        periodsPerYear = 12; 
        break;
      case CapitalizationPeriod.trimestral:
        periodsPerYear = 4; 
        break;
      case CapitalizationPeriod.cuatrimestral:
        periodsPerYear = 3; 
        break;
      case CapitalizationPeriod.semestral:
        periodsPerYear = 2; 
        break;
      case CapitalizationPeriod.anual:
      default:
        periodsPerYear = 1; 
    }

      //effectiveInterestRate = (/ 100) / periodsPerYear;
   
    double capitalResult = ((pow(amount / capital, (1 / time))-1).toDouble());
    final result = double.parse(capitalResult.toStringAsFixed(3));
    return result;
  }


  @override
  Future<double> calculateInterestRate2({
    required double amount, 
    required double capital}) async {
    double capitalResult = amount - capital;
    final result = double.parse(capitalResult.toStringAsFixed(3));
    return result;
  }


  @override
  Future<double> calculateTimeComp(
      {required double amount,
      required double capital,
      required double capInterestRate,
      required CapitalizationPeriod capitalizationPeriod}) async {
          double effectiveInterestRate;
    int periodsPerYear;

    switch (capitalizationPeriod) {
      case CapitalizationPeriod.diario:
        periodsPerYear = 365; 
        break;
      case CapitalizationPeriod.semanal:
        periodsPerYear = 52; 
        break;
      case CapitalizationPeriod.mensual:
        periodsPerYear = 12; 
        break;
      case CapitalizationPeriod.trimestral:
        periodsPerYear = 4; 
        break;
      case CapitalizationPeriod.cuatrimestral:
        periodsPerYear = 3; 
        break;
      case CapitalizationPeriod.semestral:
        periodsPerYear = 2; 
        break;
      case CapitalizationPeriod.anual:
      default:
        periodsPerYear = 1; 
    }

    //effectiveInterestRate = (capInterestRate / 100) / periodsPerYear;
    
    double timeResult =(log(amount) - log(capital) / log(1 + capInterestRate));
    final result = timeResult;
    return result;
  }
  

  
  
  }
  