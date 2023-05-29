import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.vector,
    required this.label,
    super.key,
    this.onPressed,
  });

  final String vector;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
        onPressed: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: Constants.boxShadow,
            borderRadius: BorderRadius.circular(Sizes.small),
            color: context.colorScheme.secondary,
          ),
          child: Container(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Row(
              children: [
                SvgPicture.asset(vector),
                const SizedBox(width: Sizes.medium),
                Text(label, style: context.textTheme.titleSmall),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.colorScheme.onSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
