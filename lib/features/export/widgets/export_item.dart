import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/export/export.dart';
import 'package:meddly/features/settings/settings.dart';
import 'package:open_file_plus/open_file_plus.dart';

class ExportItem extends ConsumerWidget {
  const ExportItem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      exportControllerProvider,
      (_, state) => _listen(state, context),
    );

    return SettingsItem(
      vector: Vectors.pdf,
      label: 'Exportar mis datos',
      onPressed: () async {
        unawaited(
          ref.read(exportControllerProvider.notifier).exportPdf(),
        );

        await showDialog<void>(
          context: context,
          builder: (_) {
            return ProviderScope(
              parent: ProviderScope.containerOf(context),
              child: const ExportDialog(),
            );
          },
        );
      },
    );
  }

  Future<void> _listen(ExportState state, BuildContext context) async {
    return switch (state) {
      ExportError(:final err) => showSnackBar(context, err),
      ExportLoading() => null,
      ExportSuccess(:final file) => _onSuccess(file, context),
      _ => null,
    };
  }

  Future<void> _onSuccess(File? file, BuildContext context) async {
    GoRouter.of(context).pop();

    if (file == null) return;

    await OpenFile.open(file.path);
  }
}
