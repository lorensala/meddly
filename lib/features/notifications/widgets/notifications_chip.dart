import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';

class CustomFilterChip<T> extends ConsumerWidget {
  const CustomFilterChip({
    required this.type,
    required this.onSelect,
    required this.onUnselect,
    required this.label,
    super.key,
    this.isSelected = false,
  });

  final T type;
  final String label;
  // ignore: avoid_positional_boolean_parameters
  final VoidCallback onSelect;
  final VoidCallback onUnselect;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterChip(
      selected: isSelected,
      checkmarkColor: context.colorScheme.primary,
      shadowColor: Colors.transparent,
      selectedShadowColor: Colors.transparent,
      label: Text(label),
      shape: StadiumBorder(
        side: BorderSide(
          color: context.colorScheme.primary.withOpacity(0.5),
        ),
      ),
      onSelected: (bool value) {
        if (isSelected) {
          onUnselect();
        } else {
          onSelect();
        }
      },
    );
  }
}
