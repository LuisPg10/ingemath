import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class CompoundInterestScreen extends StatelessWidget {
  const CompoundInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interes Compuesto"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xFFFFDC62),
              borderRadius: BorderRadius.circular(20)),
          child: const _CompoundInterestForm(),
        ),
      ),
    );
  }
}

class _CompoundInterestForm extends ConsumerWidget {
  final menuOptions = const <String, String>{
    "amount": "Monto compuesto",
    "capitalComp": "Capital compuesto",
    "capInterestRate": "Tasa de interés",
    "timeComp": "Tiempo compuesto",
  };

  const _CompoundInterestForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyOptions = menuOptions.keys.toList();
    final CompoundForm = ref.watch(compoundFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            const SizedBox(height: 20),
            Text("Selecciona variable a calcular",
                style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Variable a calcular",
              options: menuOptions,
              onSelected: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onOptionsCompoundChanged(value!);
              },
              errorText: CompoundForm.isFormPosted &&
                      CompoundForm.optionCompound == "none"
                  ? "Seleccione la variable a calcular"
                  : null,
            ),
            const SizedBox(height: 20),
            Text("Completa la siguiente información",
                style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            //Form
            CustomTextFormField(
              enable: CompoundForm.optionCompound != keyOptions.first,
              label: "Monto compuesto",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onOptionsAmountCompoundChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: CompoundForm.isFormPosted &&
                      CompoundForm.optionCompound != "amount"
                  ? CompoundForm.amount.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              
              enable: CompoundForm.optionCompound != keyOptions[1],
              label: "Capital",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onCapitalCompoundChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: CompoundForm.isFormPosted &&
                      CompoundForm.optionCompound != "capital"
                  ? CompoundForm.capital.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              enable: CompoundForm.optionCompound != keyOptions[2],
              label: "Tasa de interés",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onInteresRateCompoundChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: CompoundForm.isFormPosted &&
                      CompoundForm.optionCompound != "capInterestRate"
                  ? CompoundForm.capInterestRate.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              enable: CompoundForm.optionCompound != keyOptions.last,
              label: "Tiempo o periodo",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onTimeCompoundChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: CompoundForm.isFormPosted &&
                      CompoundForm.optionCompound != "time"
                  ? CompoundForm.time.errorMessage
                  : null,
            ),
             const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed: ref.read(compoundFormProvider.notifier).calculate,
                child: const Text("Calcular"),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity - 30,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFD3AD24),
              ),
              child: Text("Resultado: ${CompoundForm.result}",
                  style: const TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
