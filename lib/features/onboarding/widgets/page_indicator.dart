import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.isCurrentPage,
    super.key,
  });

  final bool isCurrentPage;

  static const _duration = Duration(milliseconds: 300);
  static const _maxWidth = 40.0;
  static const _minWidth = 20.0;
  static const _height = 10.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCurrentPage ? _maxWidth : _minWidth,
      height: _height,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? Theme.of(context).colorScheme.primary
            : context.colorScheme.onSecondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Sizes.large),
      ),
      duration: _duration,
    );
  }
}
