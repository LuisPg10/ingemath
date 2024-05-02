import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/repositories/repositories.dart';

final interestRateRepositoryProvider = Provider((ref) {
  return CalculationInterestRateRepositoryImpl();
});
