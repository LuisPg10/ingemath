import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';
import 'package:ingemath/presentation/providers/providers.dart';

final annuityFormProvider = StateNotifierProvider
.autoDispose<AnnuityFormNotifier, AnnuityFormState>(
  (ref) {
    final annuityRepository = ref.watch(annuityRepositorytProvider);

    return AnnuityFormNotifier(
      repository: annuityRepository,
    );
  }
);

enum AnnuityVariable { none, amount, annuityValue, interestRate, time }

class AnnuityFormState {

  final menuOptions = const <AnnuityVariable, String>{
    AnnuityVariable.amount: "Monto anualidad",
    AnnuityVariable.annuityValue: "Valor actual de la anualidad",
    AnnuityVariable.interestRate: "Tasa de interés",
    AnnuityVariable.time: "Tiempo anualidad",
  };

  final bool isFormPosted;
  final bool isValid;
  final AnnuityVariable variable;
  final DataNumber amount;
  final DataNumber annuityValue;
  final InterestRate interestRate;
  final DataNumber time;
  final double result;

  AnnuityFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.variable = AnnuityVariable.none,
    this.amount = const DataNumber.pure(),
    this.annuityValue = const DataNumber.pure(),
    this.interestRate = const InterestRate.pure(),
    this.time = const DataNumber.pure(),
    this.result = 0,
  });

  AnnuityFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    AnnuityVariable? variable,
    DataNumber? amount,
    DataNumber? annuityValue,
    InterestRate? interestRate,
    DataNumber? time,
    double? result,
  }) => AnnuityFormState(

    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    variable: variable ?? this.variable,
    amount: amount ?? this.amount,
    annuityValue: annuityValue ?? this.annuityValue,
    interestRate: interestRate ?? this.interestRate,
    time: time ?? this.time,
    result: result ?? this.result,
  );
}

class AnnuityFormNotifier extends StateNotifier<AnnuityFormState> {

  CalculationAnnuitiesRepositoryImpl repository;

  AnnuityFormNotifier({
    required this.repository,
  }) : super(AnnuityFormState());

  void onOptionsAnnuitiesChanged(AnnuityVariable value) {
    state = state.copyWith(
      variable: value,
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

  void onInterestRateChanged(int value) {
    state = state.copyWith(
      interestRate: InterestRate.dirty(value),
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
    switch(state.variable) {
      case AnnuityVariable.amount :
        result = await repository.calculateAmount(
          interestRate: state.interestRate.value,
          annuityValue: state.annuityValue.value,
          time: state.time.value,
        );
        break;

      case AnnuityVariable.annuityValue :
        result = await repository.calculateAnnuityValue(
          interestRate: state.interestRate.value,
          amount: state.amount.value,
          time: state.time.value,
        );
        break;

      case AnnuityVariable.interestRate :
        result = await repository.calculateInterestRate(
          amount: state.amount.value,
          annuityValue: state.annuityValue.value,
          time: state.time.value,
        );
        break;
        
      case AnnuityVariable.time :
        result = await repository.calculateTime(
          amount: state.amount.value,
          annuityValue: state.annuityValue.value,
          interestRate: state.interestRate.value,
        );
        break;
      default :
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

      isValid: state.variable != AnnuityVariable.none && Formz.validate([
        if (state.variable != AnnuityVariable.amount) state.amount,
        if (state.variable != AnnuityVariable.annuityValue) state.annuityValue,
        if(state.variable != AnnuityVariable.interestRate) state.interestRate,
        if(state.variable != AnnuityVariable.time) state.time,
      ]),
    );
  }
}
