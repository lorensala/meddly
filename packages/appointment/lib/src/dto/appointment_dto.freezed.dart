// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentDto _$AppointmentDtoFromJson(Map<String, dynamic> json) {
  return _AppointmentDto.fromJson(json);
}

/// @nodoc
mixin _$AppointmentDto {
  String get date => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get doctor => throw _privateConstructorUsedError;
  String? get speciality => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentDtoCopyWith<AppointmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDtoCopyWith<$Res> {
  factory $AppointmentDtoCopyWith(
          AppointmentDto value, $Res Function(AppointmentDto) then) =
      _$AppointmentDtoCopyWithImpl<$Res, AppointmentDto>;
  @useResult
  $Res call(
      {String date,
      String name,
      String? doctor,
      String? speciality,
      String? location,
      String? notes,
      int id});
}

/// @nodoc
class _$AppointmentDtoCopyWithImpl<$Res, $Val extends AppointmentDto>
    implements $AppointmentDtoCopyWith<$Res> {
  _$AppointmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? doctor = freezed,
    Object? speciality = freezed,
    Object? location = freezed,
    Object? notes = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentDtoCopyWith<$Res>
    implements $AppointmentDtoCopyWith<$Res> {
  factory _$$_AppointmentDtoCopyWith(
          _$_AppointmentDto value, $Res Function(_$_AppointmentDto) then) =
      __$$_AppointmentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      String name,
      String? doctor,
      String? speciality,
      String? location,
      String? notes,
      int id});
}

/// @nodoc
class __$$_AppointmentDtoCopyWithImpl<$Res>
    extends _$AppointmentDtoCopyWithImpl<$Res, _$_AppointmentDto>
    implements _$$_AppointmentDtoCopyWith<$Res> {
  __$$_AppointmentDtoCopyWithImpl(
      _$_AppointmentDto _value, $Res Function(_$_AppointmentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? doctor = freezed,
    Object? speciality = freezed,
    Object? location = freezed,
    Object? notes = freezed,
    Object? id = null,
  }) {
    return _then(_$_AppointmentDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentDto extends _AppointmentDto {
  const _$_AppointmentDto(
      {required this.date,
      required this.name,
      this.doctor,
      this.speciality,
      this.location,
      this.notes,
      required this.id})
      : super._();

  factory _$_AppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentDtoFromJson(json);

  @override
  final String date;
  @override
  final String name;
  @override
  final String? doctor;
  @override
  final String? speciality;
  @override
  final String? location;
  @override
  final String? notes;
  @override
  final int id;

  @override
  String toString() {
    return 'AppointmentDto(date: $date, name: $name, doctor: $doctor, speciality: $speciality, location: $location, notes: $notes, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, name, doctor, speciality, location, notes, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentDtoCopyWith<_$_AppointmentDto> get copyWith =>
      __$$_AppointmentDtoCopyWithImpl<_$_AppointmentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentDtoToJson(
      this,
    );
  }
}

abstract class _AppointmentDto extends AppointmentDto {
  const factory _AppointmentDto(
      {required final String date,
      required final String name,
      final String? doctor,
      final String? speciality,
      final String? location,
      final String? notes,
      required final int id}) = _$_AppointmentDto;
  const _AppointmentDto._() : super._();

  factory _AppointmentDto.fromJson(Map<String, dynamic> json) =
      _$_AppointmentDto.fromJson;

  @override
  String get date;
  @override
  String get name;
  @override
  String? get doctor;
  @override
  String? get speciality;
  @override
  String? get location;
  @override
  String? get notes;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentDtoCopyWith<_$_AppointmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}
