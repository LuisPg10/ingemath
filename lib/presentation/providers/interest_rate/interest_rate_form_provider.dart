import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:ingemath/domain/domain.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';
import 'package:ingemath/presentation/providers/providers.dart';

final interestRateFormProvider = StateNotifierProvider
.autoDispose<InterestRateFormNotifier, InterestRateFormState>((ref) {
  final interestRateRepository = ref.watch(interestRateRepositoryProvider);

  return InterestRateFormNotifier(
    repository: interestRateRepository,
  );
});

enum TypeInterest { none, simple, compound }

class InterestRateFormState {
  final menuOptions = const <TypeInterest, String>{
    TypeInterest.compound: "Interés compuesto",
    TypeInterest.simple: "Interés simple",
  };

  final bool isFormPosted;
  final bool isValid;
  final TypeInterest typeInterest;
  final DataNumber amount;
  final DataNumber capital;
  final DataNumber time;
  final DataNumber interest;
  final double result;

  InterestRateFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.typeInterest = TypeInterest.none,
    this.amount = const DataNumber.pure(),
    this.capital = const DataNumber.pure(),
    this.time = const DataNumber.pure(),
    this.interest = const DataNumber.pure(),
    this.result = 0,
  });

  InterestRateFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    TypeInterest? typeInterest,
    DataNumber? amount,
    DataNumber? capital,
    DataNumber? time,
    DataNumber? interest,
    double? result,
  }) => InterestRateFormState(

    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    typeInterest: typeInterest ?? this.typeInterest,
    amount: amount ?? this.amount,
    capital: capital ?? this.capital,
    time: time ?? this.time,
    interest: interest ?? this.interest,
    result: result ?? this.result,
  );
}

class InterestRateFormNotifier extends StateNotifier<InterestRateFormState> {
  CalculationInterestRateRepository repository;

  InterestRateFormNotifier({
    required this.repository,
  }) : super(InterestRateFormState());

  void onTypeInterestChanged(TypeInterest value) {
    state = state.copyWith(typeInterest: value);
  }

  void onAmountChangeg(double value) {
    state = state.copyWith(
      amount: DataNumber.dirty(value),
    );
  }

  void onCapitalChanged(double value) {
    state = state.copyWith(
      capital: DataNumber.dirty(value),
    );
  }

  void onInterestChanged(double value) {
    state = state.copyWith(
      interest: DataNumber.dirty(value),
    );
  }

  void onTimeChanged(double value) {
    state = state.copyWith(
      time: DataNumber.dirty(value),
    );
  }

  void calculate() async {
    _touchEveryField();

    if (!state.isValid) return;

    double result = 0;
    switch (state.typeInterest) {
      case TypeInterest.simple:
        result = await repository.calculateSimpleInterestRate(
          capital: state.capital.value,
          interest: state.interest.value,
          time: state.time.value,
        );
        break;

      case TypeInterest.compound:
        result = await repository.calculateCompundInterestRate(
          amount: state.amount.value,
          capital: state.capital.value,
          interest: state.interest.value,
          timeCapitalization: state.time.value,
        );
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
      interest: DataNumber.dirty(state.interest.value),
      time: DataNumber.dirty(state.time.value),
      isValid: state.typeInterest != TypeInterest.none && Formz.validate([
        if (state.typeInterest == TypeInterest.compound) state.amount,
        state.capital,
        state.interest,
        state.time,
      ]),
    );
  }
}
