import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ingemath/presentation/providers/providers.dart';
import 'package:ingemath/presentation/widgets/widgets.dart';

class CustomTimeFormField extends StatelessWidget {
  const CustomTimeFormField({
    super.key,
    required this.simpleInterestForm,
    required this.keyOptions,
    required this.ref,
  });

  final SimpleFormState simpleInterestForm;
  final List<SimpleVariable> keyOptions;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      showIcon: true,
      icon: Icons.calendar_today,
      enable: simpleInterestForm.variable != keyOptions[3],
      label: "Tiempo en Años",
      controller: TextEditingController(
        text: simpleInterestForm.time.value.toStringAsFixed(3),
      ),
      errorMessage: simpleInterestForm.isFormPosted &&
              simpleInterestForm.variable != SimpleVariable.time
          ? simpleInterestForm.time.errorMessage
          : null,
      onIconPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController daysController = TextEditingController();
            TextEditingController weeksController = TextEditingController();
            TextEditingController monthsController = TextEditingController();
            TextEditingController yearsController = TextEditingController();

            return AlertDialog(
              title: const Text("Establecer Tiempo"),
              content: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: yearsController,
                      decoration: const InputDecoration(labelText: 'Años'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: monthsController,
                      decoration: const InputDecoration(labelText: 'Meses'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: weeksController,
                      decoration: const InputDecoration(labelText: 'Semanas'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: daysController,
                      decoration: const InputDecoration(labelText: 'Días'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomFilledButton(
                        onPressed: () {
                          double days =
                              double.tryParse(daysController.text) ?? 0;
                          double weeks =
                              double.tryParse(weeksController.text) ?? 0;
                          double months =
                              double.tryParse(monthsController.text) ?? 0;
                          double years =
                              double.tryParse(yearsController.text) ?? 0;

                          years += (days / 360);
                          years += (weeks / 52);
                          years += (months / 12);

                          Navigator.of(context).pop();

                          ref
                              .read(simpleFormProvider.notifier)
                              .onTimeChanged(years);
                        },
                        child: const Text("Establecer"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
