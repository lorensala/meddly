import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class UserFormPage extends StatelessWidget {
  const UserFormPage({super.key});

  static String get routeName => 'user-form';
  static String get fullRouteName => '${UserPage.routeName}/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
        leading: Consumer(
          builder: (context, ref, child) {
            return BackButton(
              onPressed: () async {
                final form = ref.read(userFormControllerProvider);
                final isEditing = ref.read(
                  userFormControllerProvider.select((value) => value.isEditing),
                );

                if (!isEditing) {
                  return ref.read(goRouterProvider).pop();
                }

                if (form.isDirty) {
                  await showConfirmDialog(
                    context,
                    ref,
                    onConfirm: () {
                      ref.read(goRouterProvider).pop();
                      ref.read(goRouterProvider).pop();
                    },
                    onCancel: () {
                      ref.read(goRouterProvider).pop();
                    },
                  );
                } else {
                  ref.read(goRouterProvider).pop();
                }
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: SizedBox(
          height: Sizes.buttonHeight,
          child: Consumer(
            builder: (context, ref, child) {
              final isEditing = ref.watch(
                userFormControllerProvider.select((value) => value.isEditing),
              );
              final isValid = ref.watch(
                    userFormControllerProvider.select((value) => value.isValid),
                  ) ||
                  !isEditing;
              final isLoading = ref
                  .watch(
                    userControllerProvider,
                  )
                  .isLoading;

              return Button(
                isValid: isValid,
                isLoading: isLoading,
                onPressed: () {
                  if (isEditing) {
                    ref.read(userFormControllerProvider.notifier).save();
                  } else {
                    ref
                        .read(userFormControllerProvider.notifier)
                        .isEditingChange();
                  }
                },
                label: isEditing ? context.l10n.save : context.l10n.editUser,
              );
            },
          ),
        ),
      ),
      body: const UserForm(),
    );
  }
}

class UserForm extends ConsumerWidget {
  const UserForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          children: [
            const _EmailInput(),
            const SizedBox(height: Sizes.medium),
            const _NameInput(),
            const SizedBox(height: Sizes.medium),
            const _LastNameInput(),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.phone,
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.phoneNumberHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.sex.when(
                male: () => context.l10n.male,
                female: () => context.l10n.female,
              ),
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.sexHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.birth
                  .toString()
                  .split(' ')[0]
                  .split('-')
                  .reversed
                  .join('/'),
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.birthdateHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            const _HeightInput(),
            const SizedBox(height: Sizes.medium),
            const _WeigthInput(),
          ],
        ),
      ),
    );
  }
}

class _WeigthInput extends ConsumerWidget {
  const _WeigthInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weight = ref.watch(
      userFormControllerProvider.select((value) => value.weight),
    );
    final isEditing = ref
        .watch(userFormControllerProvider.select((value) => value.isEditing));
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      enabled: isEditing,
      keyboardType: TextInputType.number,
      style: context.textTheme.bodyMedium,
      onChanged: ref.read(userFormControllerProvider.notifier).weightChange,
      initialValue: weight.value.split('.')[0],
      decoration: InputDecoration(
        filled: !isEditing,
        errorText: !weight.isPure
            ? weight.error?.when(
                invalid: () => context.l10n.invalidWeight,
                negative: () => context.l10n.weightNegative,
                empty: () => context.l10n.weightEmpty,
                zero: () => context.l10n.weightZero,
              )
            : null,
        suffixIcon: weight.isValid && isEditing ? const CircleCheck() : null,
        labelText: context.l10n.weight,
      ),
    );
  }
}

class _HeightInput extends ConsumerWidget {
  const _HeightInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(
      userFormControllerProvider.select((value) => value.height),
    );
    final isEditing = ref
        .watch(userFormControllerProvider.select((value) => value.isEditing));

    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      enabled: isEditing,
      keyboardType: TextInputType.number,
      style: context.textTheme.bodyMedium,
      initialValue: height.value.split('.')[0],
      onChanged: ref.read(userFormControllerProvider.notifier).heightChange,
      decoration: InputDecoration(
        filled: !isEditing,
        errorText: !height.isPure
            ? height.error?.when(
                invalid: () => context.l10n.invalidHeight,
                negative: () => context.l10n.heightNegative,
                empty: () => context.l10n.heightEmpty,
                zero: () => context.l10n.heightZero,
              )
            : null,
        suffixIcon: height.isValid && isEditing ? const CircleCheck() : null,
        labelText: context.l10n.height,
      ),
    );
  }
}

class _LastNameInput extends ConsumerWidget {
  const _LastNameInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastName = ref.watch(
      userFormControllerProvider.select((value) => value.lastname),
    );
    final isEditing = ref
        .watch(userFormControllerProvider.select((value) => value.isEditing));

    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      enabled: isEditing,
      onChanged: ref.read(userFormControllerProvider.notifier).lastnameChange,
      style: context.textTheme.bodyMedium,
      initialValue: lastName.value,
      decoration: InputDecoration(
        filled: !isEditing,
        errorText: !lastName.isPure
            ? lastName.error?.when(
                invalid: () => context.l10n.invalidLastName,
                tooLong: () => context.l10n.lastNameTooLong,
                empty: () => context.l10n.lastNameEmpty,
              )
            : null,
        suffixIcon: lastName.isValid && isEditing ? const CircleCheck() : null,
        labelText: context.l10n.lastNameHint,
      ),
    );
  }
}

class _NameInput extends ConsumerWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(
      userFormControllerProvider.select((value) => value.name),
    );
    final isEditing = ref
        .watch(userFormControllerProvider.select((value) => value.isEditing));

    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      enabled: isEditing,
      onChanged: ref.read(userFormControllerProvider.notifier).nameChange,
      style: context.textTheme.bodyMedium,
      initialValue: firstName.value,
      decoration: InputDecoration(
        filled: !isEditing,
        errorText: !firstName.isPure
            ? firstName.error?.when(
                invalid: () => context.l10n.invalidName,
                tooLong: () => context.l10n.nameTooLong,
                empty: () => context.l10n.nameEmpty,
              )
            : null,
        suffixIcon: firstName.isValid && isEditing ? const CircleCheck() : null,
        labelText: context.l10n.nameHint,
      ),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref
        .watch(userFormControllerProvider.select((value) => value.isEditing));
    final email = ref.watch(
      userFormControllerProvider.select((value) => value.email),
    );

    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      enabled: isEditing,
      style: context.textTheme.bodyMedium,
      initialValue: email.value,
      onChanged: ref.read(userFormControllerProvider.notifier).emailChange,
      decoration: InputDecoration(
        filled: !isEditing,
        errorText: !email.isPure
            ? email.error?.when(
                invalid: () => context.l10n.invalidEmail,
                empty: () => context.l10n.emailEmpty,
              )
            : null,
        suffixIcon: email.isValid && isEditing ? const CircleCheck() : null,
        errorMaxLines: 2,
        labelText: context.l10n.emailHint,
      ),
    );
  }
}
