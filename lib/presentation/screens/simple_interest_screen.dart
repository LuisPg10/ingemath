import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class SimpleInterestScreen extends StatelessWidget {
  const SimpleInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Interés simple"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDC62),
            borderRadius: BorderRadius.circular(20)
          ),
          child: const _SimpleInterestForm(),
        ),
      ),
    );
  }
}

class _SimpleInterestForm extends ConsumerWidget {
  
  final menuOptions = const <String, String>{
    "capital": "Capital",
    "rateInterest": "Tasa de interés",
    "time": "Tiempo",
    "interest": "Interés",
    "amount": "Monto",
  };

  const _SimpleInterestForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final simpleInterestForm = ref.watch(simpleFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
        
            CustomDropDownMenu(
              hintText: "Variable a calcular",
              options: menuOptions,
              onSelected: (value){}
            ),
        
            const SizedBox(height: 40),
            Text("Completa la siguiente información", style: textStyles.bodyLarge),
            const SizedBox(height: 30),
        
            //* Form
            CustomTextFormField(
              label: "Capital",
              onChanged: (value) {
                ref.read(simpleFormProvider.notifier).
                onCapitalChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted
              ? simpleInterestForm.capital.errorMessage
              : null,
            ),
        
            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Tasa de interés",
              onChanged: (value) {
                ref.read(simpleFormProvider.notifier).
                onRateInterestChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted
              ? simpleInterestForm.rateInterest.errorMessage
              : null,
            ),

            const SizedBox(height: 15),

            CustomTextFormField(
              label: "Tiempo",
              onChanged: (value) {
                ref.read(simpleFormProvider.notifier).
                onTimeChanged(double.tryParse(value) ?? 0);
              },
              errorMessage: simpleInterestForm.isFormPosted
              ? simpleInterestForm.time.errorMessage
              : null,
            ),

            const SizedBox(height: 60),

            SizedBox(
              width: double.infinity,
              height: 40, 
              child: CustomFilledButton(
                onPressed: ref.read(simpleFormProvider.notifier).calculate,
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
              child: Text("Resultado: ${simpleInterestForm.result}",
                style: const TextStyle(color: Colors.white)
              ),
            )
          ],
        ),
      ),
    );
  }
}