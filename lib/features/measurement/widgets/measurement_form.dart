import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/sizes.dart';
import 'package:meddly/features/measurement/cubit/measurement_form_cubit.dart';
import 'package:meddly/widgets/widgets.dart';

class NewMeasurementForm extends StatelessWidget {
  const NewMeasurementForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ValueInput(),
        SizedBox(height: Sizes.mediumSpacing),
        _TypeInput(),
        SizedBox(height: Sizes.mediumSpacing),
        _DateSelector(),
        SizedBox(height: Sizes.mediumSpacing),
        SubmitButton(),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementFormCubit, MeasurementFormState>(
      builder: (context, state) {
        return Button(
          isValid: state.status.isValid,
          isLoading: state.status.isSubmissionInProgress,
          onPressed: () => context.read<MeasurementFormCubit>().submit(),
          label: 'Añadir medición',
        );
      },
    );
  }
}

class _DateSelector extends StatelessWidget {
  const _DateSelector([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementFormCubit, MeasurementFormState>(
      builder: (context, state) {
        return TextFormField();
        // CubitDateSelector(
        //   onConfirm: (time) =>
        //       context.read<MeasurementFormCubit>().onDateChanged(time),
        //   hasError: state.date.invalid,
        //   errorText: 'Fecha inválida',
        //   selectedDate: state.date.value,
        // );
      },
    );
  }
}

class _TypeInput extends StatelessWidget {
  const _TypeInput([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementFormCubit, MeasurementFormState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<MeasurementType>(
            items: const [],
            onChanged: (Object? value) {},
          ),
        );
      },
    );
  }
}

class _ValueInput extends StatelessWidget {
  const _ValueInput([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementFormCubit, MeasurementFormState>(
      builder: (context, state) {
        return TextFormField();
      },
    );
  }
}
