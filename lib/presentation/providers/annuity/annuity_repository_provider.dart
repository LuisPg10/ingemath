import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';

final annuityRepositorytProvider = Provider((ref) {
  return CalculationAnnuitiesRepositoryImpl();
});