import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class AnnuitiesScreen extends StatelessWidget {
  const AnnuitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDC62),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const _AnnuitiesForm(),
        ),
      ),
    );
  }
}

class _AnnuitiesForm extends ConsumerWidget {
  const _AnnuitiesForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final annuityForm = ref.watch(annuityFormProvider);
    final keyOptions = annuityForm.menuOptions.keys.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Anualidades", style: textStyles.titleLarge),
            const Divider(
              color: Color(0xFFFF833D),
              thickness: 5,
              indent: 60,
              endIndent: 60,
            ),
            const SizedBox(height: 20),
            const Concept(
              definition:
                  "Una anualidad es una serie de pagos o retiros regulares que pueden ocurrir en intervalos anuales, mensuales, trimestrales, semestrales o de otro tipo.",
              important: ["anualidad"],
              equations: [
                r"VF = A[\frac {(1+i)^n -1} {i}]",
                r"VA = A[ \frac {1 - (1+i)^{-n}} {i}]",
              ],
            ),

            //* FORM
            const SizedBox(height: 30),
            Text("Variable a Calcular", style: textStyles.bodyMedium),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: annuityForm.menuOptions,
              onSelected: (value) {
                ref
                    .read(annuityFormProvider.notifier)
                    .onOptionsAnnuitiesChanged(value);
              },
              errorText: annuityForm.isFormPosted &&
                      annuityForm.variable == AnnuityVariable.none
                  ? "Seleccione la variable a calcular"
                  : null,
            ),

            const SizedBox(height: 30),
            Text("Completa la siguiente información:",
                style: textStyles.bodyMedium?.copyWith(
                  color: const Color(0xFFF13636),
                )),

            const SizedBox(height: 15),
            CustomTextFormField(
              enable: annuityForm.variable != keyOptions[0] &&
                  annuityForm.variable != keyOptions[1],
              label: "Valor Final o Monto",
              onChanged: (value) {
                ref
                    .read(annuityFormProvider.notifier)
                    .onAmountChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
                      annuityForm.variable != keyOptions[0] &&
                      annuityForm.variable != keyOptions[1]
                  ? annuityForm.amount.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              enable: annuityForm.variable != keyOptions[2],
              label: "Valor Anualidad",
              onChanged: (value) {
                ref
                    .read(annuityFormProvider.notifier)
                    .onAnnuityValueChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
                      annuityForm.variable != keyOptions[2]
                  ? annuityForm.annuityValue.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              enable: true,
              label: "Tasa de Interés (%)",
              onChanged: (value) {
                ref
                    .read(annuityFormProvider.notifier)
                    .onInterestRateChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted
                  ? annuityForm.interestRate.errorMessage
                  : null,
            ),

            const SizedBox(height: 20),

            const Text("Tipo de capitalización"),
            const SizedBox(height: 15),

            CustomDropDownMenu(
              enable: true,
              hintText: "Seleccionar",
              options: annuityForm.capitalizationOptions,
              onSelected: (value) {
                ref
                    .read(annuityFormProvider.notifier)
                    .onCapitalizationChanged(value!);
              },
              errorText: annuityForm.isFormPosted &&
                      annuityForm.capitalization == CapitalizationInterest.none
                  ? "Seleccione la capitalización"
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTimeFormField(
              enable: annuityForm.variable != keyOptions[3],
              text: annuityForm.time.value.toStringAsFixed(3),
              setTime: ref.read(annuityFormProvider.notifier).onTimeChanged,
              errorMessage: annuityForm.isFormPosted &&
                      annuityForm.variable != AnnuityVariable.time
                  ? annuityForm.time.errorMessage
                  : null,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed: ref.read(annuityFormProvider.notifier).calculate,
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
                  const Text(
                    "RESULTADO:",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  if (annuityForm.isFormPosted)
                    Text(
                      _getResultText(annuityForm.variable, annuityForm.result),
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

String _getResultText(AnnuityVariable variable, String result) {
  switch (variable) {
    case AnnuityVariable.amount:
      return "El Monto obtenido es de: \$$result";
    case AnnuityVariable.annuityValue:
      return "El Capital obtenido es de: \$$result";
    case AnnuityVariable.annuity:
      return "El Valor de la anualidad obtenida es de: \$$result";
    case AnnuityVariable.time:
      return "El tiempo obtenido es de $result";

    default:
      return "";
  }
}
