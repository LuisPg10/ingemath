import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/interest_rate/interest_rate_form_provider.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class InterestRateScreen extends StatelessWidget {
  const InterestRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasa de interés"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDC62),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const _InteresRateForm(),
        ),
      ),
    );
  }
}


class _InteresRateForm extends ConsumerWidget {
  const _InteresRateForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final interestRateForm = ref.watch(interestRateFormProvider);
    final keyOptions = interestRateForm.menuOptions.keys.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            Text("Tasa de interés", style: textStyles.titleLarge),
            const Divider(
              color: Color(0xFFFF833D),
              thickness: 5,
              indent: 30,
              endIndent: 30,
            ),
            
            const SizedBox(height: 20),
            const Concept(
              definition: "Hace referencia a la cantidad que se abona en una unidad de tiempo por cada unidad de capital invertido",
              equations: [
                r"i = \frac {I} {Ct}",
                r"\sqrt[n]{\frac {VF} {VP}} - 1",
              ],
            ),

            //* FORM
            const SizedBox(height: 30),
            Text("Tipo de interés", style: textStyles.bodyMedium),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: interestRateForm.menuOptions,
              onSelected: (value) {
                ref.read(interestRateFormProvider.notifier)
                .onTypeInterestChanged(value!);
              },
              errorText: interestRateForm.isFormPosted &&
              interestRateForm.typeInterest == TypeInterest.none
              ? "Seleccione el tipo de interés"
              : null,
            ),

            const SizedBox(height: 30),
            Text(
              "Completa la siguiente información:",
              style: textStyles.bodyMedium?.copyWith(
                color: const Color(0xFFF13636),
              )
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: interestRateForm.typeInterest != keyOptions[1],
              label: "Monto",
              onChanged: (value) {
                ref.read(interestRateFormProvider.notifier)
                .onAmountChangeg(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted &&
                interestRateForm.typeInterest != TypeInterest.simple
              ? interestRateForm.capital.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Capital",
              onChanged: (value) {
                ref.read(interestRateFormProvider.notifier)
                .onInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted
              ? interestRateForm.interest.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Interés",
              onChanged: (value) {
                ref.read(interestRateFormProvider.notifier)
                .onInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted
              ? interestRateForm.interest.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTimeFormField(
              text: interestRateForm.time.value.toStringAsFixed(3),
              setTime: ref.read(interestRateFormProvider.notifier)
              .onTimeChanged,
              errorMessage: interestRateForm.isFormPosted
              ? interestRateForm.time.errorMessage
              : null,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed: ref.read(interestRateFormProvider.notifier).calculate,
                child: const Text("Calcular"),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              width: double.infinity - 30,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFD3AD24),
              ),
              child: Text("Resultado: ${interestRateForm.result}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}