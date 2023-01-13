import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.isCurrentPage,
    super.key,
  });

  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCurrentPage ? 30 : 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            isCurrentPage ? Theme.of(context).colorScheme.primary : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
