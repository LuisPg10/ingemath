import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../domain/domain.dart';
import '../../../infraestructure/infraestructure.dart';
import '../providers.dart';

final annuityFormProvider =
    StateNotifierProvider.autoDispose<AnnuityFormNotifier, AnnuityFormState>(
        (ref) {
  final annuityRepository = ref.watch(annuityRepositorytProvider);
  return AnnuityFormNotifier(
    repository: annuityRepository,
  );
});

enum AnnuityVariable { none, amount, annuityValue, interestRate, time, annuity }

enum CapitalizationInterest {
  none,
  days,
  weeks,
  months,
  semesters,
  years,
}

class AnnuityFormState {
  final menuOptions = const <AnnuityVariable, String>{
    AnnuityVariable.amount: "Valor Final",
    AnnuityVariable.annuityValue: "Valor Actual",
    AnnuityVariable.annuity: "Valor de Anualidad",
    AnnuityVariable.time: "Periodo o Tiempo",
  };

  final capitalizationOptions = const <CapitalizationInterest, String>{
    CapitalizationInterest.days: "Diariamente",
    CapitalizationInterest.weeks: "Semanalmente",
    CapitalizationInterest.months: "Mensualmente",
    CapitalizationInterest.semesters: "Semestralmente",
    CapitalizationInterest.years: "Anualmente",
  };

  final bool isFormPosted;
  final bool isValid;
  final AnnuityVariable variable;
  final CapitalizationInterest capitalization;
  final double temporalTime;
  final DataNumber amount;
  final DataNumber annuityValue;
  final InterestRate interestRate;
  final DataNumber time;
  final String result;

  AnnuityFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.variable = AnnuityVariable.none,
    this.capitalization = CapitalizationInterest.none,
    this.temporalTime = 0,
    this.amount = const DataNumber.pure(),
    this.annuityValue = const DataNumber.pure(),
    this.interestRate = const InterestRate.pure(),
    this.time = const DataNumber.pure(),
    this.result = "",
  });

  AnnuityFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    AnnuityVariable? variable,
    CapitalizationInterest? capitalization,
    double? temporalTime,
    DataNumber? amount,
    DataNumber? annuityValue,
    InterestRate? interestRate,
    DataNumber? time,
    String? result,
  }) =>
      AnnuityFormState(
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        variable: variable ?? this.variable,
        capitalization: capitalization ?? this.capitalization,
        temporalTime: temporalTime ?? this.temporalTime,
        amount: amount ?? this.amount,
        annuityValue: annuityValue ?? this.annuityValue,
        interestRate: interestRate ?? this.interestRate,
        time: time ?? this.time,
        result: result ?? this.result,
      );
}

class AnnuityFormNotifier extends StateNotifier<AnnuityFormState> {
  CalculationAnnuitiesRepository repository;

  AnnuityFormNotifier({
    required this.repository,
  }) : super(AnnuityFormState());

  void onOptionsAnnuitiesChanged(AnnuityVariable value) {
    state = state.copyWith(
      variable: value,
    );
  }

  void clearFieldsAndResult() {
    clearFields();
    clearResult();
  }

  void clearFields() {
    state = state.copyWith(
      amount: const DataNumber.pure(),
      annuityValue: const DataNumber.pure(),
      time: const DataNumber.pure(),
      interestRate: const InterestRate.pure(),
    );
  }

  void clearResult() {
    state = state.copyWith(
      result: "",
      isFormPosted: false,
      isValid: false,
    );
  }

  void onAmountChanged(double value) {
    state = state.copyWith(
      amount: DataNumber.dirty(value),
    );
  }

  void onAnnuityValueChanged(double value) {
    state = state.copyWith(
      annuityValue: DataNumber.dirty(value),
    );
  }

  void onInterestRateChanged(double value) {
    state = state.copyWith(
      interestRate: InterestRate.dirty(value),
    );
  }

  void onCapitalizationChanged(CapitalizationInterest value) {
    state = state.copyWith(
      capitalization: value,
    );

    switch (state.capitalization) {
      case CapitalizationInterest.days:
        state =
            state.copyWith(time: DataNumber.dirty(state.temporalTime * 360));
        break;
      case CapitalizationInterest.months:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 12));
        break;
      case CapitalizationInterest.weeks:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 52));
        break;
      case CapitalizationInterest.semesters:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 2));
        break;
      case CapitalizationInterest.years:
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
      case CapitalizationInterest.days:
        state =
            state.copyWith(time: DataNumber.dirty(state.temporalTime * 360));
        break;
      case CapitalizationInterest.months:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 12));
        break;
      case CapitalizationInterest.weeks:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 52));
        break;
      case CapitalizationInterest.semesters:
        state = state.copyWith(time: DataNumber.dirty(state.temporalTime * 2));
        break;
      case CapitalizationInterest.years:
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

    String result = "";

    switch (state.variable) {
      case AnnuityVariable.amount:
        double amount = await repository.calculateFinalValue(
          annuityRate: state.interestRate.value,
          annuityValue: state.annuityValue.value,
          time: state.time.value,
        );
        result = amount.toString();
        break;

      case AnnuityVariable.annuityValue:
        double annuityValue = await repository.calculateCurrentValue(
          annuityRate: state.interestRate.value,
          annuityValue: state.annuityValue.value,
          time: state.time.value,
        );
        result = annuityValue.toString();
        break;

      case AnnuityVariable.annuity:
        double annuity = await repository.calculateAnnuityValue(
          annuityRate: state.interestRate.value,
          amount: state.amount.value,
          time: state.time.value,
        );
        result = annuity.toString();
        break;

      case AnnuityVariable.interestRate:
        double interestRate = await repository.calculateAnnuityRate(
          amount: state.amount.value,
          annuityValue: state.annuityValue.value,
          time: state.time.value,
        );
        result = interestRate.toString();
        break;

      case AnnuityVariable.time:
        String time = await repository.calculateTime(
          amount: state.amount.value,
          annuityValue: state.annuityValue.value,
          annuityRate: state.interestRate.value,
        );
        result = time;
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
      annuityValue: DataNumber.dirty(state.annuityValue.value),
      time: DataNumber.dirty(state.time.value),
      interestRate: InterestRate.dirty(state.interestRate.value),
      isValid: state.variable != AnnuityVariable.none &&
          Formz.validate([
            if (state.variable != AnnuityVariable.amount &&
                state.variable != AnnuityVariable.annuityValue)
              state.amount,
            if (state.variable != AnnuityVariable.annuity) state.annuityValue,
            if (state.variable != AnnuityVariable.interestRate)
              state.interestRate,
            if (state.variable != AnnuityVariable.time) state.time,
          ]),
    );
  }
}
