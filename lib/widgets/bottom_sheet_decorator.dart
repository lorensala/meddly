import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class BottomSheetDecoration extends StatelessWidget {
  const BottomSheetDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width / 4,
        height: 5,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(Sizes.medium),
        ),
      ),
    );
  }
}
