import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../domain/domain.dart';
import '../../../infraestructure/infraestructure.dart';
import '../providers.dart';

final interestRateFormProvider = StateNotifierProvider.autoDispose<
    InterestRateFormNotifier, InterestRateFormState>((ref) {
  final interestRateRepository = ref.watch(interestRateRepositoryProvider);

  return InterestRateFormNotifier(
    repository: interestRateRepository,
  );
});

enum TypeInterest { none, simple, compound }

enum Capitalization {
  none,
  days,
  weeks,
  months,
  years,
}

class InterestRateFormState {
  final interestOptions = const <TypeInterest, String>{
    TypeInterest.compound: "Interés compuesto",
    TypeInterest.simple: "Interés simple",
  };

  final capitalizationOptions = const <Capitalization, String>{
    Capitalization.days: "Diariamente",
    Capitalization.weeks: "Semanalmente",
    Capitalization.months: "Mensualmente",
    Capitalization.years: "Anualmente",
  };

  final bool isFormPosted;
  final bool isValid;
  final TypeInterest typeInterest;
  final DataNumber amount;
  final DataNumber capital;
  final Capitalization capitalization;
  final DataNumber time;
  final double temporalTime;
  final DataNumber interest;
  final double result;

  InterestRateFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.typeInterest = TypeInterest.none,
    this.amount = const DataNumber.pure(),
    this.capital = const DataNumber.pure(),
    this.capitalization = Capitalization.none,
    this.time = const DataNumber.pure(),
    this.temporalTime = 0,
    this.interest = const DataNumber.pure(),
    this.result = 0,
  });

  InterestRateFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    TypeInterest? typeInterest,
    DataNumber? amount,
    DataNumber? capital,
    Capitalization? capitalization,
    DataNumber? time,
    double? temporalTime,
    DataNumber? interest,
    double? result,
  }) =>
      InterestRateFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        typeInterest: typeInterest ?? this.typeInterest,
        amount: amount ?? this.amount,
        capital: capital ?? this.capital,
        capitalization: capitalization ?? this.capitalization,
        time: time ?? this.time,
        temporalTime: temporalTime ?? this.temporalTime,
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

  void onAmountChanged(double value) {
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

  void onCapitalizationChanged(Capitalization value) {
    state = state.copyWith(
      capitalization: value,
    );

    switch (state.capitalization) {
      case Capitalization.days:
        state =
            state.copyWith(time: DataNumber.dirty(state.temporalTime * 360));
        break;
      case Capitalization.months:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 12));
        break;
      case Capitalization.weeks:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 52));
        break;
      case Capitalization.years:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 1));
        break;
      default:
        break;
    }
  }

  void onTimeChanged(double value) {
    state = state.copyWith(
      temporalTime: value,
    );

    switch (state.capitalization) {
      case Capitalization.days:
        state =
            state.copyWith(time: DataNumber.dirty(state.temporalTime * 360));
        break;
      case Capitalization.months:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 12));
        break;
      case Capitalization.weeks:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 52));
        break;
      case Capitalization.years:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 1));
        break;
      default:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime));
        break;
    }
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
      isValid: (state.typeInterest != TypeInterest.simple &&
              state.capitalization != Capitalization.none) &&
          state.typeInterest != TypeInterest.none &&
          Formz.validate([
            if (state.typeInterest == TypeInterest.compound) state.amount,
            if (state.typeInterest == TypeInterest.simple) state.interest,
            state.capital,
            state.time,
          ]),
    );
  }
}
