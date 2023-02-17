import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/view/medicine_presentation_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineNameForm extends StatelessWidget {
  const MedicineNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: SvgPicture.asset(Assets.pills),
            ),
            const SizedBox(height: Sizes.largeSpacing),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Padding(
                padding: Sizes.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputLabel(
                      label: context.l10n.medicineName,
                      isRequired: true,
                    ),
                    const SizedBox(height: Sizes.smallSpacing),
                    const _NameInputField(),
                    const SizedBox(height: Sizes.smallSpacing),
                    InputDescription(
                      description: context.l10n.medicineDescription,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Button(
          isValid: state.name.valid,
          onPressed: () =>
              Navigator.of(context).push(MedicinePresentationPage.route()),
          label: context.l10n.next,
        );
      },
    );
  }
}

class _NameInputField extends StatelessWidget {
  const _NameInputField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          onChanged: cubit.nameChanged,
          decoration: InputDecoration(
            errorText: !state.name.pure && state.name.invalid
                ? state.name.error?.when(
                    invalid: () => context.l10n.invalidMedicineName,
                    tooLong: () => context.l10n.medicineNameTooLong,
                    empty: () => context.l10n.medicineNameEmpty,
                  )
                : null,
          ),
        );
      },
    );
  }
}
