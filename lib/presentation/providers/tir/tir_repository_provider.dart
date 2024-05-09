import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

final tirRepositoryProvider = Provider((ref) {
  return CalculationTirRepositoryImpl();
});