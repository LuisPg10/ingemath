import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/infraestructure/repositories/repositories.dart';

final interestRateRepositoryProvider = Provider((ref) {
  return CalculationInterestRateRepositoryImpl();
});