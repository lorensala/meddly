import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.builder,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      error: (err, stackTrace) {
        return errorWidget(err.toString());
      },
      loading: loadingWidget,
    );
  }

  static Widget errorWidget(String message) {
    return Center(
      child: Text(message),
    );
  }

  static Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
