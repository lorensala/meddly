// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Calendar {
  List<Medicine> get activeMedicines => throw _privateConstructorUsedError;
  List<Appointment> get appointments => throw _privateConstructorUsedError;
  List<Measurement> get measurements => throw _privateConstructorUsedError;
  List<Consumption> get consumptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarCopyWith<Calendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarCopyWith<$Res> {
  factory $CalendarCopyWith(Calendar value, $Res Function(Calendar) then) =
      _$CalendarCopyWithImpl<$Res, Calendar>;
  @useResult
  $Res call(
      {List<Medicine> activeMedicines,
      List<Appointment> appointments,
      List<Measurement> measurements,
      List<Consumption> consumptions});
}

/// @nodoc
class _$CalendarCopyWithImpl<$Res, $Val extends Calendar>
    implements $CalendarCopyWith<$Res> {
  _$CalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeMedicines = null,
    Object? appointments = null,
    Object? measurements = null,
    Object? consumptions = null,
  }) {
    return _then(_value.copyWith(
      activeMedicines: null == activeMedicines
          ? _value.activeMedicines
          : activeMedicines // ignore: cast_nullable_to_non_nullable
              as List<Medicine>,
      appointments: null == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      measurements: null == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
      consumptions: null == consumptions
          ? _value.consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<Consumption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarCopyWith<$Res> implements $CalendarCopyWith<$Res> {
  factory _$$_CalendarCopyWith(
          _$_Calendar value, $Res Function(_$_Calendar) then) =
      __$$_CalendarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Medicine> activeMedicines,
      List<Appointment> appointments,
      List<Measurement> measurements,
      List<Consumption> consumptions});
}

/// @nodoc
class __$$_CalendarCopyWithImpl<$Res>
    extends _$CalendarCopyWithImpl<$Res, _$_Calendar>
    implements _$$_CalendarCopyWith<$Res> {
  __$$_CalendarCopyWithImpl(
      _$_Calendar _value, $Res Function(_$_Calendar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeMedicines = null,
    Object? appointments = null,
    Object? measurements = null,
    Object? consumptions = null,
  }) {
    return _then(_$_Calendar(
      activeMedicines: null == activeMedicines
          ? _value._activeMedicines
          : activeMedicines // ignore: cast_nullable_to_non_nullable
              as List<Medicine>,
      appointments: null == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
      measurements: null == measurements
          ? _value._measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
      consumptions: null == consumptions
          ? _value._consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<Consumption>,
    ));
  }
}

/// @nodoc

class _$_Calendar extends _Calendar {
  const _$_Calendar(
      {required final List<Medicine> activeMedicines,
      required final List<Appointment> appointments,
      required final List<Measurement> measurements,
      required final List<Consumption> consumptions})
      : _activeMedicines = activeMedicines,
        _appointments = appointments,
        _measurements = measurements,
        _consumptions = consumptions,
        super._();

  final List<Medicine> _activeMedicines;
  @override
  List<Medicine> get activeMedicines {
    if (_activeMedicines is EqualUnmodifiableListView) return _activeMedicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeMedicines);
  }

  final List<Appointment> _appointments;
  @override
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  final List<Measurement> _measurements;
  @override
  List<Measurement> get measurements {
    if (_measurements is EqualUnmodifiableListView) return _measurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measurements);
  }

  final List<Consumption> _consumptions;
  @override
  List<Consumption> get consumptions {
    if (_consumptions is EqualUnmodifiableListView) return _consumptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumptions);
  }

  @override
  String toString() {
    return 'Calendar(activeMedicines: $activeMedicines, appointments: $appointments, measurements: $measurements, consumptions: $consumptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Calendar &&
            const DeepCollectionEquality()
                .equals(other._activeMedicines, _activeMedicines) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            const DeepCollectionEquality()
                .equals(other._measurements, _measurements) &&
            const DeepCollectionEquality()
                .equals(other._consumptions, _consumptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeMedicines),
      const DeepCollectionEquality().hash(_appointments),
      const DeepCollectionEquality().hash(_measurements),
      const DeepCollectionEquality().hash(_consumptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarCopyWith<_$_Calendar> get copyWith =>
      __$$_CalendarCopyWithImpl<_$_Calendar>(this, _$identity);
}

abstract class _Calendar extends Calendar {
  const factory _Calendar(
      {required final List<Medicine> activeMedicines,
      required final List<Appointment> appointments,
      required final List<Measurement> measurements,
      required final List<Consumption> consumptions}) = _$_Calendar;
  const _Calendar._() : super._();

  @override
  List<Medicine> get activeMedicines;
  @override
  List<Appointment> get appointments;
  @override
  List<Measurement> get measurements;
  @override
  List<Consumption> get consumptions;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarCopyWith<_$_Calendar> get copyWith =>
      throw _privateConstructorUsedError;
}
