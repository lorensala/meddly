import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.builder,
    this.loading,
    this.error,
    this.onRetry,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T) builder;
  final Widget? loading;
  final Widget? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      error: (err, stackTrace) {
        final message = err is String ? err : context.l10n.unknownError;
        if (error == null) {
          return ErrorContainer(message: message, onRetry: onRetry);
        } else {
          return error!;
        }
      },
      loading: () => loading ?? _loadingWidget(),
    );
  }

  static Widget errorWidget(String message) {
    return Center(
      child: Text(message),
    );
  }

  static Widget _loadingWidget() {
    return const Center(
      child: RepaintBoundary(child: CircularProgressIndicator()),
    );
  }
}
