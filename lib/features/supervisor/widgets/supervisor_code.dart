import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';
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
                  'Código copiado al portapapeles',
                );
              } catch (e) {
                showSnackBar(context, 'Error al copiar el código');
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
