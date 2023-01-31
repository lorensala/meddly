import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/calendar/cubit/selected_date_cubit.dart';

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
            BlocBuilder<SelectedDateCubit, SelectedDateState>(
              builder: (_, state) {
                return Text(
                  state.selectedDate!.toNamedDayNumberAndMonthString(),
                );
              },
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
