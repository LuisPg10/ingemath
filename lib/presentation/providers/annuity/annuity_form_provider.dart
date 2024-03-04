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

class AnnuityFormState {
  final bool isFormPosted;
  final bool isValid;
  final String optionAnnuity;
  final DataNumber amount;
  final DataNumber currentAnnuity;
  final DataNumber annuityRate;
  final DataNumber currentValue;
  final double result;

  AnnuityFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.optionAnnuity = "none",
    this.amount = const DataNumber.pure(),
    this.currentAnnuity = const DataNumber.pure(),
    this.annuityRate = const DataNumber.pure(),
    this.currentValue = const DataNumber.pure(),
    this.result = 0,
  });

  AnnuityFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    String? optionAnnuity,
    DataNumber? amount,
    DataNumber? currentAnnuity,
    DataNumber? annuityRate,
    DataNumber? currentValue,
    double? result,
  }) => AnnuityFormState(

    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    optionAnnuity: optionAnnuity ?? this.optionAnnuity,
    amount: amount ?? this.amount,
    currentAnnuity: currentAnnuity ?? this.currentAnnuity,
    annuityRate: annuityRate ?? this.annuityRate,
    currentValue: currentValue ?? this.currentValue,
    result: result ?? this.result,
  );
}

class AnnuityFormNotifier extends StateNotifier<AnnuityFormState> {

  CalculationAnnuitiesRepositoryImpl repository;

  AnnuityFormNotifier({
    required this.repository,
  }) : super(AnnuityFormState());

  void onOptionsAnnuitiesChanged(String value) {
    state = state.copyWith(
      optionAnnuity: value
    );
  }

  void onAmountChanged(double value) {
    state = state.copyWith(
      amount: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.currentAnnuity,
        state.annuityRate,
        state.currentValue,
      ]),
    );
  }

  void onCurrentAnnuityChanged(double value) {
    state = state.copyWith(
      currentAnnuity: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.amount,
        state.annuityRate,
        state.currentValue,
      ]),
    );
  }

  void onAnnuityRateChanged(double value) {
    state = state.copyWith(
      annuityRate: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.currentAnnuity,
        state.amount,
        state.currentValue,
      ]
      ),
    );
  }

  void onCurrentValueChanged(double value) {
    state = state.copyWith(
      currentValue: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.currentAnnuity,
        state.amount,
        state.annuityRate,
      ]),
    );
  }

  void calculate() async {
    _touchEveryField();
    
    if (!state.isValid) return;

    final result = await repository.calculateAmount(
      annuityRate: state.annuityRate.value,
      currentAnnuity: state.currentAnnuity.value,
      currentValue: state.currentValue.value.toInt(),
    );
    state = state.copyWith(result: result);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      amount: DataNumber.dirty(state.amount.value),
      currentAnnuity: DataNumber.dirty(state.currentAnnuity.value),
      currentValue: DataNumber.dirty(state.currentValue.value),
      annuityRate: DataNumber.dirty(state.annuityRate.value),
    );
  }
}
