import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   'Select the presentation of the medicine',
            //   style: context.textTheme.titleLarge,
            // ),
            // const SizedBox(height: Sizes.mediumSpacing),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
                buildWhen: (previous, current) =>
                    previous.presentation != current.presentation,
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: MedicinePresentation.common
                        .map(
                          (presentation) => ListTile(
                            title: Text(presentation.name.capitalize()),
                            trailing: cubit.state.presentation == presentation
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () =>
                                cubit.presentationChanged(presentation),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: Sizes.largeSpacing),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
                buildWhen: (previous, current) =>
                    previous.presentation != current.presentation,
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: MedicinePresentation.uncommon
                        .map(
                          (presentation) => ListTile(
                            title: Text(presentation.name.capitalize()),
                            trailing: cubit.state.presentation == presentation
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () =>
                                cubit.presentationChanged(presentation),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: Sizes.mediumSpacing),
            Button(
              onPressed: () {},
              label: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
