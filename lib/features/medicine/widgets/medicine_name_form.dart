import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineNameForm extends StatelessWidget {
  const MedicineNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: const Padding(
              padding: Sizes.padding,
              child: _NameInputField(),
            ),
          ),
          const SizedBox(height: Sizes.mediumSpacing),
          Button(onPressed: () {}, label: 'Next'),
        ],
      ),
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
          decoration: const InputDecoration(
            hintText: 'Medicine name',
          ),
        );
      },
    );
  }
}
