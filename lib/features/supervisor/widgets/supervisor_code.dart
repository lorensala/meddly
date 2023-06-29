import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SupervisorCode extends ConsumerWidget {
  const SupervisorCode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);

    return AsyncValueWidget(
      value: user,
      builder: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: GestureDetector(
            onTap: () {
              try {
                Clipboard.setData(
                  ClipboardData(text: user?.invitation ?? ''),
                );
                showSnackBar(
                  context,
                  context.l10n.copyCodeSuccess,
                );
              } catch (e) {
                showSnackBar(context, context.l10n.copyCodeError);
              }
            },
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: TextFormField(
                enabled: false,
                textAlign: TextAlign.center,
                initialValue: user?.invitation,
                style: context.textTheme.titleLarge,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.copy),
                ),
                onChanged: (value) => ref
                    .read(supervisorCodeFormControllerProvider.notifier)
                    .codeChanged(value),
              ),
            ),
          ),
        );
      },
    );
  }
}
