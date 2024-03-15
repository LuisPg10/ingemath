import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';
import '../widgets/shared/custom_time_form_field.dart';

class SimpleInterestScreen extends StatelessWidget {
  const SimpleInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interés Simple"),
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
  const _SimpleInterestForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleInterestForm = ref.watch(simpleFormProvider);
    final keyOptions = simpleInterestForm.menuOptions.keys.toList();
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomOperationTitle(
              title: "Interés Simple",
              length: 220,
            ),
            const SizedBox(height: 20),
            DefinitionSimpleInterest(textStyles: textStyles),

            Text(
              "Calculadora de Interés Simple",
              style: GoogleFonts.montserrat().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),
            Text("Selecciona Variable a Calcular", style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: simpleInterestForm.menuOptions,
              onSelected: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onOptionsSimpleChanged(value!);
              },
              errorText: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.variable == SimpleVariable.none
                  ? "Seleccione la variable a calcular"
                  : null,
            ),

            const SizedBox(height: 30),
            Text(
              "Completa la siguiente información:",
              style: GoogleFonts.montserrat().copyWith(
                color: const Color(0xFFF13636),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            //FORM
            CustomTextFormField(
              enable: simpleInterestForm.variable != keyOptions[1],
              label: "Capital",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.variable != SimpleVariable.capital
                  ? simpleInterestForm.capital.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: simpleInterestForm.variable != keyOptions[2] &&
                  simpleInterestForm.variable != keyOptions[0],
              label: "Interés",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.variable != SimpleVariable.interest &&
                      simpleInterestForm.variable != SimpleVariable.amount
                  ? simpleInterestForm.interest.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: simpleInterestForm.variable != keyOptions[4],
              label: "Tasa de Interés (%)",
              onChanged: (value) {
                ref
                    .read(simpleFormProvider.notifier)
                    .onRateInterestChanged(int.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted &&
                      simpleInterestForm.variable != SimpleVariable.interestRate
                  ? simpleInterestForm.rateInterest.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTimeFormField(
              simpleInterestForm: simpleInterestForm,
              keyOptions: keyOptions,
              ref: ref,
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
                  Text(
                    _getResultText(
                        simpleInterestForm.variable, simpleInterestForm.result),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getResultText(SimpleVariable variable, String result) {
  switch (variable) {
    case SimpleVariable.amount:
      return "El Monto obtenido es de: \$$result";
    case SimpleVariable.capital:
      return "El Capital obtenido es de: \$$result";
    case SimpleVariable.interestRate:
      return "La Tasa de Interés obtenida es de: $result%";
    case SimpleVariable.time:
      return "El Tiempo obtenido es de: $result";
    case SimpleVariable.interest:
      return "El Interés obtenido es de: \$$result";
    default:
      return "El resultado es: $result";
  }
}
