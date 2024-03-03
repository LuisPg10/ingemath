import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class AnnuitiesScreen extends StatelessWidget {
  const AnnuitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anualidades"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDC62),
            borderRadius: BorderRadius.circular(20)
          ),
          child: const _AnnuitiesForm(),
        ),
      ),
    );
  }
}

final annuitiesOptions = <String, String>{
  "amount": "Monto anualidad",
  "currentAnnuity": "Valor anualidad actual",
  "annuityRate": "Tasa de interés",
  "currentValue": "Tiempo anualidad",
};

class _AnnuitiesForm extends ConsumerWidget {
  const _AnnuitiesForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final annuityForm = ref.watch(annuityFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
        
            OperationsDropDownMenu( options: annuitiesOptions, onSelected: (value){}),
        
            const SizedBox(height: 20),
            Text("Completa la siguiente información", style: textStyles.bodyLarge),
            const SizedBox(height: 10),
        
            //* Form
            CustomTextFormField(
              label: "Monto anualidad",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onAmountChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted
              ? annuityForm.amount.errorMessage
              : null,
            ),
            
            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Valor anualidad actual",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onCurrentAnnuityChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted
              ? annuityForm.currentAnnuity.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Tasa de interés",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onAnnuityRateChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted
              ? annuityForm.annuityRate.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Tiempo de la anualidad",
              onChanged: (value) {
                ref.read(annuityFormProvider.notifier).
                onCurrentValueChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: annuityForm.isFormPosted
              ? annuityForm.currentValue.errorMessage
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
                style: const TextStyle(color: Colors.white)
              ),
            )
          ],
        ),
      ),
    );
  }
}