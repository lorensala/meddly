import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/export/export.dart';

class ExportDialog extends ConsumerWidget {
  const ExportDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      exportControllerProvider,
      (_, state) => switch (state) {
        ExportSuccess() => Navigator.of(context).pop(),
        _ => null,
      },
    );
    final progress = ref.watch(
      exportControllerProvider.select((state) {
        return switch (state) {
          ExportLoading(:final progress) => progress,
          ExportSuccess() => 1.0,
          _ => 0.0,
        };
      }),
    );
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Exportando datos...'),
          const SizedBox(height: Sizes.medium),
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.small),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: context.colorScheme.surface,
            ),
          ),
          const SizedBox(height: Sizes.medium),
          Text('${(progress * 100).toStringAsFixed(0)}%'),
        ],
      ),
    );
  }
}
