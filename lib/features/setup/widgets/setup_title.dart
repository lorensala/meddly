import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({
    required this.title,
    this.isRequired = false,
    super.key,
  });

  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          text: title,
          children: [
            if (isRequired)
              TextSpan(
                text: '*',
                style: context.textTheme.titleLarge!.copyWith(
                  color: context.colorScheme.error,
                ),
              )
          ],
        ),
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
