import 'package:formz/formz.dart';

enum InterestRateError { empty, notValid }

class InterestRate extends FormzInput<double, InterestRateError> {
  // Call super.pure to represent an unmodified form input.
  const InterestRate.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const InterestRate.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == InterestRateError.empty) {
      return 'Digite un valor valido';
    }
    if (displayError == InterestRateError.notValid) {
      return 'Debe ser un valor entre 0% a 100%';
    }

    return null;
  }

  @override
  InterestRateError? validator(double value) {
    final cleanValue = value.toString().trim();
    if (cleanValue.isEmpty) return InterestRateError.empty;

    final isDouble = value / 100;

    if (isDouble > 1 || isDouble <= 0) return InterestRateError.notValid;

    return null;
  }
}
