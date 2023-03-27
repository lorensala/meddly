// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarDto _$CalendarDtoFromJson(Map<String, dynamic> json) {
  return _CalendarDto.fromJson(json);
}

/// @nodoc
mixin _$CalendarDto {
  List<MedicineDto> get activeMedicines => throw _privateConstructorUsedError;
  List<AppointmentDto> get appointments => throw _privateConstructorUsedError;
  List<MeasurementDto> get measurements => throw _privateConstructorUsedError;
  List<ConsumptionDto> get consumptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarDtoCopyWith<CalendarDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDtoCopyWith<$Res> {
  factory $CalendarDtoCopyWith(
          CalendarDto value, $Res Function(CalendarDto) then) =
      _$CalendarDtoCopyWithImpl<$Res, CalendarDto>;
  @useResult
  $Res call(
      {List<MedicineDto> activeMedicines,
      List<AppointmentDto> appointments,
      List<MeasurementDto> measurements,
      List<ConsumptionDto> consumptions});
}

/// @nodoc
class _$CalendarDtoCopyWithImpl<$Res, $Val extends CalendarDto>
    implements $CalendarDtoCopyWith<$Res> {
  _$CalendarDtoCopyWithImpl(this._value, this._then);

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
              as List<MedicineDto>,
      appointments: null == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<AppointmentDto>,
      measurements: null == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<MeasurementDto>,
      consumptions: null == consumptions
          ? _value.consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<ConsumptionDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarDtoCopyWith<$Res>
    implements $CalendarDtoCopyWith<$Res> {
  factory _$$_CalendarDtoCopyWith(
          _$_CalendarDto value, $Res Function(_$_CalendarDto) then) =
      __$$_CalendarDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MedicineDto> activeMedicines,
      List<AppointmentDto> appointments,
      List<MeasurementDto> measurements,
      List<ConsumptionDto> consumptions});
}

/// @nodoc
class __$$_CalendarDtoCopyWithImpl<$Res>
    extends _$CalendarDtoCopyWithImpl<$Res, _$_CalendarDto>
    implements _$$_CalendarDtoCopyWith<$Res> {
  __$$_CalendarDtoCopyWithImpl(
      _$_CalendarDto _value, $Res Function(_$_CalendarDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeMedicines = null,
    Object? appointments = null,
    Object? measurements = null,
    Object? consumptions = null,
  }) {
    return _then(_$_CalendarDto(
      activeMedicines: null == activeMedicines
          ? _value._activeMedicines
          : activeMedicines // ignore: cast_nullable_to_non_nullable
              as List<MedicineDto>,
      appointments: null == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<AppointmentDto>,
      measurements: null == measurements
          ? _value._measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<MeasurementDto>,
      consumptions: null == consumptions
          ? _value._consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<ConsumptionDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarDto extends _CalendarDto {
  const _$_CalendarDto(
      {final List<MedicineDto> activeMedicines = const [],
      final List<AppointmentDto> appointments = const [],
      final List<MeasurementDto> measurements = const [],
      final List<ConsumptionDto> consumptions = const []})
      : _activeMedicines = activeMedicines,
        _appointments = appointments,
        _measurements = measurements,
        _consumptions = consumptions,
        super._();

  factory _$_CalendarDto.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarDtoFromJson(json);

  final List<MedicineDto> _activeMedicines;
  @override
  @JsonKey()
  List<MedicineDto> get activeMedicines {
    if (_activeMedicines is EqualUnmodifiableListView) return _activeMedicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeMedicines);
  }

  final List<AppointmentDto> _appointments;
  @override
  @JsonKey()
  List<AppointmentDto> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  final List<MeasurementDto> _measurements;
  @override
  @JsonKey()
  List<MeasurementDto> get measurements {
    if (_measurements is EqualUnmodifiableListView) return _measurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measurements);
  }

  final List<ConsumptionDto> _consumptions;
  @override
  @JsonKey()
  List<ConsumptionDto> get consumptions {
    if (_consumptions is EqualUnmodifiableListView) return _consumptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumptions);
  }

  @override
  String toString() {
    return 'CalendarDto(activeMedicines: $activeMedicines, appointments: $appointments, measurements: $measurements, consumptions: $consumptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarDto &&
            const DeepCollectionEquality()
                .equals(other._activeMedicines, _activeMedicines) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            const DeepCollectionEquality()
                .equals(other._measurements, _measurements) &&
            const DeepCollectionEquality()
                .equals(other._consumptions, _consumptions));
  }

  @JsonKey(ignore: true)
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
  _$$_CalendarDtoCopyWith<_$_CalendarDto> get copyWith =>
      __$$_CalendarDtoCopyWithImpl<_$_CalendarDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarDtoToJson(
      this,
    );
  }
}

abstract class _CalendarDto extends CalendarDto {
  const factory _CalendarDto(
      {final List<MedicineDto> activeMedicines,
      final List<AppointmentDto> appointments,
      final List<MeasurementDto> measurements,
      final List<ConsumptionDto> consumptions}) = _$_CalendarDto;
  const _CalendarDto._() : super._();

  factory _CalendarDto.fromJson(Map<String, dynamic> json) =
      _$_CalendarDto.fromJson;

  @override
  List<MedicineDto> get activeMedicines;
  @override
  List<AppointmentDto> get appointments;
  @override
  List<MeasurementDto> get measurements;
  @override
  List<ConsumptionDto> get consumptions;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarDtoCopyWith<_$_CalendarDto> get copyWith =>
      throw _privateConstructorUsedError;
}
