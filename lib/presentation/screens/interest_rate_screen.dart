import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';


class InterestRateScreen extends StatelessWidget {
  const InterestRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      height: 200,
      showArrow: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 700,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDC62),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const _InteresRateForm(),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class _InteresRateForm extends ConsumerWidget {
  const _InteresRateForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final interestRateForm = ref.watch(interestRateFormProvider);
    final interestOptions = interestRateForm.interestOptions.keys.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Tasa de interés", style: textStyles.titleLarge),
            const Divider(
              color: Color(0xFFFF833D),
              thickness: 5,
              indent: 50,
              endIndent: 50,
            ),

            const SizedBox(height: 20),
            const Concept(
              definition:
                  "Hace referencia a la cantidad que se abona en una unidad de tiempo por cada unidad de capital invertido",
              equations: [
                r"i = \frac {I} {Ct}",
                r"J = \sqrt[n]{\frac {VF} {VP}} - 1",
              ],
            ),

            //* FORM
            const SizedBox(height: 30),
            Text("Tipo de interés", style: textStyles.bodyMedium),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: interestRateForm.interestOptions,
              onSelected: (value) {
                ref
                    .read(interestRateFormProvider.notifier)
                    .onTypeInterestChanged(value!);
              },
              errorText: interestRateForm.isFormPosted &&
                      interestRateForm.typeInterest == TypeInterest.none
                  ? "Seleccione el tipo de interés"
                  : null,
            ),

            const SizedBox(height: 30),
            Text("Completa la siguiente información:",
                style: textStyles.bodyMedium?.copyWith(
                  color: const Color(0xFFF13636),
                )),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: interestRateForm.typeInterest != interestOptions[1],
              label: "Monto",
              onChanged: (value) {
                ref
                    .read(interestRateFormProvider.notifier)
                    .onAmountChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted &&
                      interestRateForm.typeInterest != TypeInterest.simple
                  ? interestRateForm.amount.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Capital",
              onChanged: (value) {
                ref
                    .read(interestRateFormProvider.notifier)
                    .onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted
                  ? interestRateForm.capital.errorMessage
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: interestRateForm.typeInterest != interestOptions[0],
              label: "Interés",
              onChanged: (value) {
                ref
                    .read(interestRateFormProvider.notifier)
                    .onInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: interestRateForm.isFormPosted &&
                      interestRateForm.typeInterest != TypeInterest.compound
                  ? interestRateForm.interest.errorMessage
                  : null,
            ),

            const SizedBox(height: 20),

            const Text("Tipo de capitalización"),
            const SizedBox(height: 15),

            CustomDropDownMenu(
              enable: interestRateForm.typeInterest == interestOptions[0],
              hintText: "Seleccionar",
              options: interestRateForm.capitalizationOptions,
              onSelected: (value) {
                ref
                    .read(interestRateFormProvider.notifier)
                    .onCapitalizationChanged(value!);
              },
              errorText: interestRateForm.isFormPosted &&
                      interestRateForm.capitalization ==
                          CapitalizationInterest.none &&
                      interestRateForm.typeInterest == interestOptions[0]
                  ? "Seleccione la capitalización"
                  : null,
            ),

            const SizedBox(height: 15),

            CustomTimeFormField(
              label: "Tiempo",
              text: interestRateForm.time.value.toStringAsFixed(3),
              setTime:
                  ref.read(interestRateFormProvider.notifier).onTimeChanged,
              errorMessage: interestRateForm.isFormPosted
                  ? interestRateForm.time.errorMessage
                  : null,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed:
                    ref.read(interestRateFormProvider.notifier).calculate,
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
              child: Text(
                "Resultado: ${interestRateForm.result}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
