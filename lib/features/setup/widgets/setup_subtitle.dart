import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class FormSubtitle extends StatelessWidget {
  const FormSubtitle({
    required this.subtitle,
    super.key,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        subtitle,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
    );
  }
}
