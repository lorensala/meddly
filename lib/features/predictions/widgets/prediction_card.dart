import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class PredictionCard extends StatelessWidget {
  const PredictionCard({
    required this.title,
    required this.description,
    required this.vector,
    required this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final String vector;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.secondary,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.small),
        ),
      ),
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.medium),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.small),
          boxShadow: boxShadow(context),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: Sizes.extraSmall),
                  Text(
                    description,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSecondary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
