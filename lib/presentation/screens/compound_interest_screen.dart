import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
  const _CompoundInterestForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compoundForm = ref.watch(compoundFormProvider);
    final keyOptions = compoundForm.menuOptions.keys.toList();
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
              hintText: "Seleccionar",
              options: compoundForm.menuOptions,
              onSelected: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onOptionsCompoundChanged(value!);
              },
              errorText: compoundForm.isFormPosted &&
                      compoundForm.variable == CompoundVariable.none
                  ? "Seleccione la variable a calcular"
                  : null,
            ),
            const SizedBox(height: 20),
            Text("Completa la siguiente información",
                style: GoogleFonts.montserrat().copyWith(
                color: const Color(0xFFF13636),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),),
            const SizedBox(height: 10),

            //Form
            CustomTextFormField(
              enable: compoundForm.variable != keyOptions[0],
              label: "Monto compuesto",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onAmountChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: compoundForm.isFormPosted &&
                      compoundForm.variable != keyOptions.first
                  ? compoundForm.amount.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
          
              enable: compoundForm.variable != keyOptions[1],
              label: "Capital",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: compoundForm.isFormPosted &&
                      compoundForm.variable != CompoundVariable.capital
                  ? compoundForm.capital.errorMessage
                  : null,
            ),
            const SizedBox(height: 15),

            CustomTextFormField(
              enable: compoundForm.variable != keyOptions[2],
              label: "Tasa de interés",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onInterestRateChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: compoundForm.isFormPosted &&
                      compoundForm.variable != keyOptions[2]
                  ? compoundForm.capInterestRate.errorMessage
                  : null,
            ),
            const SizedBox(height: 20),
            Text("Seleccione Capitalizacion",
                style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar ",
              options: compoundForm.menuOptionsCap,
              onSelected: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onOptionsCapitalizationChanged(value!);
              },
              errorText: compoundForm.isFormPosted &&
                      compoundForm.variable == CompoundVariable.none
                  ? "Seleccione Capitalizacion"
                  : null,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              enable: compoundForm.variable != keyOptions.last,
              label: "Tiempo",
              onChanged: (value) {
                ref
                    .read(compoundFormProvider.notifier)
                    .onTimeChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: compoundForm.isFormPosted &&
                      compoundForm.variable != keyOptions.last
                  ? compoundForm.time.errorMessage
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
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity - 30,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFD3AD24),
              ),
              child: Text("Resultado: ${compoundForm.result}",
                  style: const TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
