import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class DropDownSelector<T> extends StatelessWidget {
  const DropDownSelector({
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Padding(
        padding: Sizes.horizontalPadding,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
            value: value,
            items: items,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
