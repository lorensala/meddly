import 'package:flutter/material.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            PageIndicator(isCurrentPage: currentPage == 0),
            const SizedBox(width: 15),
            PageIndicator(isCurrentPage: currentPage == 1),
            const SizedBox(width: 15),
            PageIndicator(isCurrentPage: currentPage == 2),
          ],
        ),
      ],
    );
  }
}
