import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar.freezed.dart';

/// {@template calendar}
/// A calendar.
/// {@endtemplate}
@freezed
class Calendar with _$Calendar {
  /// {@macro calendar}
  const factory Calendar({
    required int id,
    required String name,
    required String color,
    required int userId,
  }) = _Calendar;
  const Calendar._();
}
