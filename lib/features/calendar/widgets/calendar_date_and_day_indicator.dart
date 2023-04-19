import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class CalendarDateAndDayIndicator extends StatelessWidget {
  const CalendarDateAndDayIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ColoredBox(
        color: context.colorScheme.background,
        child: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
