import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meddly/features/calendar/core/core.dart';

part 'selected_date_cubit.freezed.dart';
part 'selected_date_state.dart';

class SelectedDateCubit extends Cubit<SelectedDateState> {
  SelectedDateCubit({DateTime? selectedDate})
      : super(
          SelectedDateState(
            daysOfTheYear: getAllDaysInYear(),
            selectedDate: selectedDate ?? DateTime.now(),
          ),
        );

  void selectDateChanged(DateTime date) => emit(
        state.copyWith(
          selectedDate: date,
        ),
      );
}
