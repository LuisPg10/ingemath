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

enum CompoundInterestVariable { none, amount, capital, capInterestRate, time }

class CompoundFormState {
  final menuOptions = const <CompoundInterestVariable, String>{
    CompoundInterestVariable.amount: "Monto compuesto",
    CompoundInterestVariable.capital: "Capital compuesto",
    CompoundInterestVariable.capInterestRate: "Tasa de interés",
    CompoundInterestVariable.time: "Tiempo compuesto",
  };

  final bool isFormPosted;
  final bool isValid;
  final CompoundInterestVariable variable;
  final DataNumber amount;
  final DataNumber capital;
  final InterestRate capInterestRate;
  final DataNumber time;
  final double result;

  CompoundFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.variable = CompoundInterestVariable.none,
    this.amount = const DataNumber.pure(),
    this.capital = const DataNumber.pure(),
    this.capInterestRate = const InterestRate.pure(),
    this.time = const DataNumber.pure(),
    this.result = 0,
  });

  CompoundFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    CompoundInterestVariable? variable,
    DataNumber? amount,
    DataNumber? capital,
    InterestRate? capInterestRate,
    DataNumber? time,
    double? result,
  }) =>
      CompoundFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        variable: variable ?? this.variable,
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

  void onOptionsCompoundChanged(CompoundInterestVariable value) {
    state = state.copyWith(variable: value);
  }

  void onOptionsAmountCompoundChanged(double value) {
    state = state.copyWith(amount: DataNumber.dirty(value));
  }

  void onCapitalCompoundChanged(double value) {
    state = state.copyWith(capital: DataNumber.dirty(value));
  }

  void onInteresRateCompoundChanged(int value) {
    state = state.copyWith(capInterestRate: InterestRate.dirty(value));
  }

  void onTimeCompoundChanged(double value) {
    state = state.copyWith(time: DataNumber.dirty(value),);
  }

  void calculate() async {
    _touchEveryField();

    if (!state.isValid) return;

    double result = 0;
    switch (state.variable) {
      case CompoundInterestVariable.amount:
        result = await repository.calculateAmountComp(
            capital: state.capital.value,
            capInterestRate: state.capInterestRate.value,
            time: state.time.value);
        break;
        
      case CompoundInterestVariable.capital:
        result = await repository.calculateCapitalComp(
            amount: state.amount.value,
            capInterestRate: state.capInterestRate.value,
            time: state.time.value);
        break;

      case CompoundInterestVariable.capInterestRate:
        result = await repository.calculateInterestRate(
            amount: state.amount.value,
            capital: state.capital.value,
            time: state.time.value);
        break;
      case CompoundInterestVariable.time:
        result = await repository.calculateTimeComp(
            amount: state.amount.value,
            capital: state.capital.value,
            capInterestRate: state.capInterestRate.value);
        break;
      default:
        break;
    }
    state = state.copyWith(result: result);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      amount: DataNumber.dirty(state.amount.value),
      capital: DataNumber.dirty(state.capital.value),
      capInterestRate: InterestRate.dirty(state.capInterestRate.value),
      time: DataNumber.dirty(state.time.value),

      isValid: state.variable != CompoundInterestVariable.none && Formz.validate([
        if(state.variable != CompoundInterestVariable.amount) state.amount,
        if(state.variable != CompoundInterestVariable.capital) state.amount,
        if(state.variable != CompoundInterestVariable.capInterestRate) state.amount,
        if(state.variable != CompoundInterestVariable.time) state.amount,
        

      ])
    );
  }
}
