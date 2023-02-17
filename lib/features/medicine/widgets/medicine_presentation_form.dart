import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/view/medicine_dosis_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: SvgPicture.asset(Assets.pills),
              ),
            ),
            const SizedBox(height: Sizes.largeSpacing),
            Text(
              context.l10n.commonPresentations,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            const _CommonPresentations(),
            const SizedBox(height: Sizes.largeSpacing),
            Text(
              context.l10n.otherPresentations,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            const _OtherPresentations(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
            const SizedBox(height: Sizes.largeSpacing),
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
    return Button(
      onPressed: () => Navigator.of(context).push(MedicineDosisPage.route()),
      label: context.l10n.next,
    );
  }
}

class _OtherPresentations extends StatelessWidget {
  const _OtherPresentations();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return DecoratedBox(
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
                    onTap: () => cubit.presentationChanged(presentation),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class _CommonPresentations extends StatelessWidget {
  const _CommonPresentations();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return DecoratedBox(
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
                    onTap: () => cubit.presentationChanged(presentation),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
