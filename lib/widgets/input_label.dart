import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    required this.label,
    required this.isRequired,
    super.key,
  });

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        style: context.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: TextStyle(color: context.colorScheme.error),
            ),
        ],
      ),
    );
  }
}
