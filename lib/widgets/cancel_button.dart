import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            return ConfirmDiscardDialog(
              onDiscard: () {
                ref.read(goRouterProvider).go(HomePage.routeName);
              },
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Center(
          child: Text(
            context.l10n.cancel,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
