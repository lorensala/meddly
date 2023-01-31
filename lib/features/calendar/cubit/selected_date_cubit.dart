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

  // @override
  // SelectedDateState? fromJson(Map<String, dynamic> json) {
  //   return SelectedDateState(
  //     selectedDate: DateTime.parse(json['selectedDate'] as String),
  //     daysOfTheYear: (json['daysOfTheYear'] as List<dynamic>)
  //         .map((e) => DateTime.parse(e as String))
  //         .toList(),
  //   );
  // }

  // @override
  // Map<String, dynamic>? toJson(SelectedDateState state) {
  //   return {
  //     'selectedDate': state.selectedDate?.toIso8601String(),
  //     'daysOfTheYear':
  //         state.daysOfTheYear.map((e) => e.toIso8601String()).toList(),
  //   };
  // }
}
