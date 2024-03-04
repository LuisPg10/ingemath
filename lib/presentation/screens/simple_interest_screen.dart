import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class SimpleInterestScreen extends StatelessWidget {
  const SimpleInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interés simple"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xFFFFDC62),
              borderRadius: BorderRadius.circular(20)),
          child: const _SimpleInterestForm(),
        ),
      ),
    );
  }
}

class _SimpleInterestForm extends ConsumerWidget {
  final menuOptions = const <String, String>{
    "amount": "Monto",
    "capital": "Capital",
    "interest": "Interés",
    "time": "Tiempo",
    "rateInterest": "Tasa de interés",
  };

  const _SimpleInterestForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyOptions = menuOptions.keys.toList();
    final simpleInterestForm = ref.watch(simpleFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Selecciona Variable a Calcular", style: textStyles.bodyLarge),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: menuOptions,
              onSelected: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onOptionsSimpleChanged(value!);
              },
              errorText: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.optionSimple == "none"
                  ? "Seleccione la variable a calcular"
                  : null,
            ),

            const SizedBox(height: 40),
            Text("Completa la siguiente información",
                style: textStyles.bodyLarge),
            const SizedBox(height: 30),

            //FORM
            CustomTextFormField(
              enable: simpleInterestForm.optionSimple != keyOptions[1],
              label: "Capital",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.optionSimple != "capital"
                  ? simpleInterestForm.capital.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: simpleInterestForm.optionSimple != keyOptions[2] &&
                  simpleInterestForm.optionSimple != keyOptions[0],
              label: "Interés",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.optionSimple != "interest" &&
                      simpleInterestForm.optionSimple != "amount"
                  ? simpleInterestForm.interest.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: simpleInterestForm.optionSimple != keyOptions[4],
              label: "Tasa de Interés",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onRateInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted
                  ? simpleInterestForm.rateInterest.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: simpleInterestForm.optionSimple != keyOptions[3],
              label: "Tiempo",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onTimeChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted
                  ? simpleInterestForm.time.errorMessage
                  : null,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed: ref.read(simpleFormProvider.notifier).calculate,
                child: const Text("Calcular"),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity - 30,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFD3AD24),
              ),
              child: Column(
                children: [
                  Text("Resultado: ${simpleInterestForm.result}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
