import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class DropDownSelector<T> extends StatelessWidget {
  const DropDownSelector({
    required this.value,
    required this.items,
    required this.onChanged,
    this.enabled = true,
    this.hasBorder = false,
    super.key,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final bool hasBorder;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: enabled
            ? context.colorScheme.secondary
            : context.colorScheme.onSecondary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Sizes.small),
        border: hasBorder
            ? Border.all(
                color: context.colorScheme.surface,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            borderRadius: BorderRadius.circular(Sizes.small),
            value: value,
            items: items,
            style: context.textTheme.bodyMedium,
            onChanged: enabled ? onChanged : null,
          ),
        ),
      ),
    );
  }
}
