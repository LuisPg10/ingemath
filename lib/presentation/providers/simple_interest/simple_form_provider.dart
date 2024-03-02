import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:ingemath/infraestructure/infraestructure.dart';
import 'package:ingemath/presentation/providers/providers.dart';

final simpleFormProvider = StateNotifierProvider
.autoDispose<SimpleFormNotifier, SimpleFormState>(
  (ref) {
    final simpleInterestRepository = ref.watch(simpleRepositorytProvider);

    return SimpleFormNotifier(
      repository: simpleInterestRepository,
    );
  }
);

class SimpleFormState {
  final bool isFormPosted;
  final bool isValid;
  final DataNumber capital;
  final DataNumber rateInterest;
  final DataNumber time;
  final double result;

  SimpleFormState({
    this.isFormPosted = false,
    this.isValid = false,
    this.capital = const DataNumber.pure(),
    this.rateInterest = const DataNumber.pure(),
    this.time = const DataNumber.pure(),
    this.result = 0,
  });

  SimpleFormState copyWith({
    bool? isFormPosted,
    bool? isValid,
    DataNumber? capital,
    DataNumber? rateInterest,
    DataNumber? time,
    double? result,
  }) => SimpleFormState(

    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    capital: capital ?? this.capital,
    rateInterest: rateInterest ?? this.rateInterest,
    time: time ?? this.time,
    result: result ?? this.result,
  );
}

class SimpleFormNotifier extends StateNotifier<SimpleFormState> {

  CalculationSimpleRepositoryImpl repository;

  SimpleFormNotifier({
    required this.repository,
  }) : super(SimpleFormState());

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

  void onRateInterestChanged(double value) {
    state = state.copyWith(
      rateInterest: DataNumber.dirty(value),
      isValid: Formz.validate([
        DataNumber.dirty(value),
        state.capital,
        state.time,
      ]
      ),
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
      time: state.time.value
    );
    state = state.copyWith(result: result);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      capital: DataNumber.dirty(state.capital.value),
      time: DataNumber.dirty(state.time.value),
      rateInterest: DataNumber.dirty(state.rateInterest.value),
    );
  }

}
