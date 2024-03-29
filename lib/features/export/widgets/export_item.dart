import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/export/export.dart';
import 'package:meddly/features/settings/settings.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:open_file_plus/open_file_plus.dart';

class ExportItem extends ConsumerWidget {
  const ExportItem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      exportControllerProvider,
      (_, state) => switch (state) {
        ExportError(:final err) => showSnackBar(context, err),
        ExportLoading() => null,
        ExportSuccess(:final file) => _onSuccess(file),
        _ => null,
      },
    );

    return SettingsItem(
      vector: Vectors.pdf,
      label: context.l10n.exportData,
      onPressed: () async {
        unawaited(
          ref.read(exportControllerProvider.notifier).exportPdf(),
        );

        unawaited(
          showDialog<void>(
            context: context,
            builder: (_) {
              return ProviderScope(
                parent: ProviderScope.containerOf(context),
                child: const ExportDialog(),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _onSuccess(File? file) async {
    if (file == null) return;

    await OpenFile.open(file.path);
  }
}
