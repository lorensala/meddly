import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';

class SetupForm extends StatelessWidget {
  const SetupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _NameInput(),
          SizedBox(height: Sizes.spacing),
          _LastnameInput(),
          // _BirthdayInput(),
          // _HeightInput(),
          // _WeightInput(),
          // _PhoneNumberInput(),
          // SexCheck??
        ],
      ),
    );
  }
}

// class _BirthdayInput extends HookWidget {
//   const _BirthdayInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SetupCubit, SetupState>(
//       builder: (context, state) {
//         return CubitDateSelector(
//           borderColor: context.colorScheme.secondaryContainer,
//           type: DateSelectorType.date,
//           onConfirm: (time) =>
//               context.read<SetupCubit>().onBirthdayChanged(time),
//           hasError: state.birthday.invalid,
//           errorText: 'Debes ser mayor de edad para utilizar Meddly',
//           selectedDate: state.birthday.value,
//         );
//       },
//     );
//   }
// }

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          onChanged: cubit.nameChanged,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: context.l10n.nameHint,
            errorText: !state.name.pure
                ? state.name.error?.when(
                    invalid: () => context.l10n.invalidName,
                    tooLong: () => context.l10n.nameTooLong,
                    empty: () => context.l10n.nameEmpty,
                  )
                : null,
          ),
        );
      },
    );
  }
}

class _LastnameInput extends StatelessWidget {
  const _LastnameInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SetupCubit>();
    return BlocBuilder<SetupCubit, SetupState>(
      buildWhen: (previous, current) => previous.lastname != current.lastname,
      builder: (context, state) {
        return TextFormField(
          onChanged: cubit.lastnameChanged,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: context.l10n.lastNameHint,
            errorText: !state.lastname.pure
                ? state.lastname.error?.when(
                    invalid: () => context.l10n.invalidLastName,
                    tooLong: () => context.l10n.lastNameTooLong,
                    empty: () => context.l10n.lastNameEmpty,
                  )
                : null,
          ),
        );
      },
    );
  }
}

// class _PhoneNumberInput extends StatelessWidget {
//   const _PhoneNumberInput();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SetupCubit, SetupState>(
//       builder: (context, state) {
//         return TextFormField(
//           //key: const Key(accountSetupNameKey),
//           textInputAction: TextInputAction.done,
//           onChanged: (String? value) {
//           BlocProvider.of<SetupCubit>(context).onPhoneNumberChanged(value!);
//           },
//           onFieldSubmitted: (String? value) {
//             HapticFeedback.lightImpact();
//             FocusScope.of(context).unfocus();
//           },
//           keyboardType: TextInputType.phone,
//           style: context.textTheme.bodyMedium,
//           decoration: const InputDecoration(
//             hintText: 'Número de teléfono',
//           ),
//         );
//       },
//     );
//   }
// }

// class _WeightInput extends StatelessWidget {
//   const _WeightInput();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.watch<SetupCubit>();
//     return BlocBuilder<SetupCubit, SetupState>(
//       builder: (context, state) {
//         return CubitInput(
//           fillColor: context.colorScheme.background,
//           onChanged: (value) {
//             if (double.tryParse(value!) != null) {
//               cubit.onWeightChanged(double.parse(value));
//             } else {
//               cubit.onWeightChanged(-1);
//             }
//           },
//           type: TextInputType.number,
//           hasError: state.weight.invalid,
//           errorText: 'Peso inválido',
//           hintText: 'Ej: 70',
//         );
//       },
//     );
//   }
// }

// class _HeightInput extends StatelessWidget {
//   const _HeightInput();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SetupCubit, SetupState>(
//       builder: (context, state) {
//         final cubtit = context.watch<SetupCubit>();

//         return CubitInput(
//           fillColor: context.colorScheme.background,
//           onChanged: (value) {
//             if (double.tryParse(value!) != null) {
//               cubtit.onHeightChanged(double.parse(value));
//             } else {
//               cubtit.onHeightChanged(-1);
//             }
//           },
//           type: TextInputType.number,
//           hasError: state.height.invalid,
//           errorText: 'Altura inválida',
//           hintText: 'Ej: 170',
//         );
//       },
//     );
//   }
// }
