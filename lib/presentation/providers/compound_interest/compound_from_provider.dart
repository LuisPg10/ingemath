import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';
import 'package:ingemath/presentation/providers/providers.dart';

final compoundFormProvider =
    StateNotifierProvider.autoDispose<CompoundFormNotifier, CompoundFormState>(
        (ref) {
  final compoundInterestRepository = ref.watch(compoundRepositorytProvider);

  return CompoundFormNotifier(
    repository: compoundInterestRepository,
  );
});

class CompoundFormState {
  final bool isFormPosted;
  final bool isValid;
  final String optionCompound;
  final DataNumber amount;
  final DataNumber capital;
  final DataNumber capInterestRate;
  final DataNumber time;
  final double result;

  CompoundFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.optionCompound = "none",
    this.amount = const DataNumber.pure(),
    this.capital = const DataNumber.pure(),
    this.capInterestRate = const DataNumber.pure(),
    this.time = const DataNumber.pure(),
    this.result = 0,
  });

  CompoundFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    String? optionCompound,
    DataNumber? amount,
    DataNumber? capital,
    DataNumber? capInterestRate,
    DataNumber? time,
    double? result,
  }) =>
      CompoundFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        optionCompound: optionCompound ?? this.optionCompound,
        amount: amount ?? this.amount,
        capital: capital ?? this.capital,
        capInterestRate: capInterestRate ?? this.capInterestRate,
        time: time ?? this.time,
        result: result ?? this.result,
      );
}

class CompoundFormNotifier extends StateNotifier<CompoundFormState> {
  CalculationCompoundRepositoryImpl repository;

  CompoundFormNotifier({
    required this.repository,
  }) : super(CompoundFormState());

  void onOptionsCompoundChanged(String value) {
    state = state.copyWith(optionCompound: value);
  }

  void onOptionsAmountCompoundChanged(double value) {
    state = state.copyWith(
      amount: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.capital,
        state.capInterestRate,
        state.time,
      ]),
    );
  }

  void onCapitalCompoundChanged(double value) {
    state = state.copyWith(
      capital: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.amount,
        state.capInterestRate,
        state.time
      ]),
    );
  }

  void onInteresRateCompoundChanged(double value) {
    state = state.copyWith(
      capInterestRate: DataNumber.dirty(value),
      isValid: Formz.validate(
          [DataNumber.dirty(value), state.amount, state.capital, state.time]),
    );
  }

  void onTimeCompoundChanged(double value) {
    state = state.copyWith(
      time: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.amount,
        state.capital,
        state.capInterestRate,
      ]),
    );
  }

  void calculate() async {
    _touchEveryField();

    if (!state.isValid) return;

    final result = await repository.calculateAmountComp(
        capital: state.capital.value,
        capInterestRate: state.capInterestRate.value,
        time: state.time.value);
    state = state.copyWith(result: result);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      capital: DataNumber.dirty(state.capital.value),
      amount: DataNumber.dirty(state.amount.value),
      time: DataNumber.dirty(state.time.value),
      capInterestRate: DataNumber.dirty(state.capInterestRate.value),
    );
  }
}
