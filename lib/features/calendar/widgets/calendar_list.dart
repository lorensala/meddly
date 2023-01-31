// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/bloc/bloc.dart';
import 'package:meddly/features/calendar/cubit/cubit.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Empty')),
          loading: () => const Center(
            child: RepaintBoundary(child: CircularProgressIndicator()),
          ),
          success: (events) {
            final selectedDate = context.select<SelectedDateCubit, DateTime?>(
              (cubit) => cubit.state.selectedDate,
            );
            final filteredEvents = events
                .where(
                  (event) =>
                      event.date.day == selectedDate!.day &&
                      event.date.month == selectedDate.month &&
                      event.date.year == selectedDate.year,
                )
                .toList();

            return Expanded(
              flex: 2,
              child: ColoredBox(
                color: context.colorScheme.background,
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<CalendarBloc>().add(
                          const CalendarEvent.fetchAll(),
                        );
                  },
                  child: ListView.separated(
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: Sizes.mediumSpacing),
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      return CalendarListItem(
                        event: filteredEvents[index],
                      );
                    },
                  ),
                ),
              ),
            );
          },
          failure: (failure) => Center(child: Text(failure.toString())),
        );
      },
    );
  }
}
