import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';
import 'package:ingemath/presentation/providers/providers.dart';

final simpleFormProvider =
    StateNotifierProvider.autoDispose<SimpleFormNotifier, SimpleFormState>(
        (ref) {
  final simpleInterestRepository = ref.watch(simpleRepositorytProvider);

  return SimpleFormNotifier(
    repository: simpleInterestRepository,
  );
});

//---------------------CAMBIOOOOOOOOOOOOOOS

class SimpleFormState {
  final bool isFormPosted;
  final bool isValid;
  final String optionSimple;
  final DataNumber capital;
  final DataNumber rateInterest;
  final DataNumber time;
  final DataNumber interest;
  final double result;

  SimpleFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.optionSimple = "none",
    this.capital = const DataNumber.pure(),
    this.rateInterest = const DataNumber.pure(),
    this.time = const DataNumber.pure(),
    this.interest = const DataNumber.pure(),
    this.result = 0,
  });

  SimpleFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    String? optionSimple,
    DataNumber? capital,
    DataNumber? rateInterest,
    DataNumber? time,
    DataNumber? interest,
    double? result,
  }) =>
      SimpleFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        optionSimple: optionSimple ?? this.optionSimple,
        capital: capital ?? this.capital,
        rateInterest: rateInterest ?? this.rateInterest,
        time: time ?? this.time,
        interest: interest ?? this.interest,
        result: result ?? this.result,
      );
}

class SimpleFormNotifier extends StateNotifier<SimpleFormState> {
  CalculationSimpleRepositoryImpl repository;

  SimpleFormNotifier({
    required this.repository,
  }) : super(SimpleFormState());

  void onOptionsSimpleChanged(String value) {
    state = state.copyWith(optionSimple: value);
  }

  void onCapitalChanged(double value) {
    state = state.copyWith(
      capital: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.rateInterest,
        state.time,
      ]),
    );
  }

  void onInterestChanged(double value) {
    state = state.copyWith(
      interest: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.capital,
        state.rateInterest,
        state.time,
      ]),
    );
  }

  void onRateInterestChanged(double value) {
    state = state.copyWith(
      rateInterest: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.capital,
        state.time,
      ]),
    );
  }

  void onTimeChanged(double value) {
    state = state.copyWith(
      time: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.capital,
        state.rateInterest,
      ]),
    );
  }

  void calculate() async {
    _touchEveryField();

    if (!state.isValid) return;

    final result = await repository.finalAmount(
        capital: state.capital.value,
        rateInterest: state.rateInterest.value,
        time: state.time.value);

    state = state.copyWith(result: result);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      capital: DataNumber.dirty(state.capital.value),
      time: DataNumber.dirty(state.time.value),
      rateInterest: DataNumber.dirty(state.rateInterest.value),
      interest: DataNumber.dirty(state.interest.value),
    );
  }
}
