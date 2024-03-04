import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class AnnuitiesScreen extends StatelessWidget {
  const AnnuitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anualidades"),
      ),
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
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            Text("Variable a calcular", style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            CustomDropDownMenu(
              hintText: "Seleccionar",
              options: annuityForm.menuOptions,
              onSelected: (value) {
                ref.read(annuityFormProvider.notifier)
                .onOptionsAnnuitiesChanged(value);
              },
              errorText: annuityForm.isFormPosted &&
              annuityForm.variable == AnnuityVariable.none
              ? "Seleccione la variable a calcular"
              : null,
            ),

            const SizedBox(height: 20),
            Text("Completa la siguiente información", style: textStyles.bodyLarge),
            const SizedBox(height: 10),

            CustomTextFormField(
              enable: annuityForm.variable != keyOptions.first,
              label: "Monto anualidad",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier)
                .onAmountChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
              annuityForm.variable != keyOptions.first
              ? annuityForm.amount.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: annuityForm.variable != keyOptions[1],
              label: "Valor actual de la anualidad",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onAnnuityValueChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
              annuityForm.variable != keyOptions[1]
              ? annuityForm.annuityValue.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: annuityForm.variable != keyOptions[2],
              label: "Tasa de interés %",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onInterestRateChanged(int.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
              annuityForm.variable != keyOptions[2]
              ? annuityForm.interestRate.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              enable: annuityForm.variable != keyOptions.last,
              label: "Tiempo de la anualidad",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onTimeChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted &&
              annuityForm.variable != keyOptions.last
              ? annuityForm.time.errorMessage
              : null,
            ),

            const SizedBox(height: 60),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomFilledButton(
                onPressed: ref.read(annuityFormProvider.notifier).calculate,
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
              child: Text("Resultado: ${annuityForm.result}",
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
