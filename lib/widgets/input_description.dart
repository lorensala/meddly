import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.bodyMedium!.copyWith(
        color: context.colorScheme.onSecondary.withOpacity(0.5),
      ),
    );
  }
}
