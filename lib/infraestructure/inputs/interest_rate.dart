import 'package:formz/formz.dart';

enum InterestRateError { empty, notValid }

class InterestRate extends FormzInput<int, InterestRateError> {

  // Call super.pure to represent an unmodified form input.
  const InterestRate.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const InterestRate.dirty( super.value ) : super.dirty();

  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == InterestRateError.empty ) return 'Digite un valor valido';
    if ( displayError == InterestRateError.notValid ) return 'Debe ser un número entero';

    return null;
  }

  @override
  InterestRateError? validator(int value) {

    final cleanValue = value.toString().trim();
    if (cleanValue.isEmpty) return InterestRateError.empty;

    if (value <= 1) return InterestRateError.notValid;

    return null;
  }
}
