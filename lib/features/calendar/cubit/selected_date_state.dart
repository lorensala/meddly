part of 'selected_date_cubit.dart';

@freezed
class SelectedDateState with _$SelectedDateState {
  const factory SelectedDateState({
    @Default([]) List<DateTime> daysOfTheYear,
    DateTime? selectedDate,
  }) = _SelectedDateState;
}
