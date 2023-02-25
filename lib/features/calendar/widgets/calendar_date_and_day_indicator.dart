import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';

import '../provider/provider.dart';

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
        child: Column(
          children: [
            _SelectedDateText(),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

class _SelectedDateText extends ConsumerWidget {
  const _SelectedDateText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Text(
      selectedDate.toNamedDayNumberAndMonthString(),
    );
  }
}
