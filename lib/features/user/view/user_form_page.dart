import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: FittedBox(
          child: Button(onPressed: () {}, label: 'Editar'),
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
            TextFormField(
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.email,
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.emailHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.firstName,
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.nameHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.lastName,
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.lastNameHint,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
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
            TextFormField(
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.height?.toString(),
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.height,
              ),
            ),
            const SizedBox(height: Sizes.medium),
            TextFormField(
              enabled: false,
              style: context.textTheme.bodyMedium,
              initialValue: user?.weight?.toString(),
              decoration: InputDecoration(
                filled: true,
                labelText: context.l10n.weight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
