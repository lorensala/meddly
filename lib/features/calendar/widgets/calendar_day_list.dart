import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/calendar/cubit/selected_date_cubit.dart';

class CalendarDayList extends StatefulWidget {
  const CalendarDayList({super.key});

  @override
  State<CalendarDayList> createState() => _CalendarDayListState();
}

class _CalendarDayListState extends State<CalendarDayList> {
  late final PageController _controller;

  @override
  void initState() {
    final selectedDate = context.read<SelectedDateCubit>().state.selectedDate;
    _controller = PageController(
      viewportFraction: 1 / 6,
      initialPage: getAllDaysInYear().indexWhere(
        (date) => date.isSameDay(selectedDate!),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final daysOfTheYear = context.read<SelectedDateCubit>().state.daysOfTheYear;

    return Container(
      color: context.colorScheme.background,
      height: 80,
      child: PageView.builder(
        onPageChanged: (index) {
          context
              .read<SelectedDateCubit>()
              .selectDateChanged(daysOfTheYear[index]);
        },
        controller: _controller,
        itemCount: daysOfTheYear.length,
        itemBuilder: (context, index) {
          return CalendarDayAndStatusIndicator(
            date: daysOfTheYear[index],
            onTap: () {
              context
                  .read<SelectedDateCubit>()
                  .selectDateChanged(daysOfTheYear[index]);
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          );
        },
      ),
    );
  }
}
