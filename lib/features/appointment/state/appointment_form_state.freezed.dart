// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppointmentFormState {
  Name get name => throw _privateConstructorUsedError;
  AppointmentSpeciality get speciality => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  Name get doctor => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppointmentFormStateCopyWith<AppointmentFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentFormStateCopyWith<$Res> {
  factory $AppointmentFormStateCopyWith(AppointmentFormState value,
          $Res Function(AppointmentFormState) then) =
      _$AppointmentFormStateCopyWithImpl<$Res, AppointmentFormState>;
  @useResult
  $Res call(
      {Name name,
      AppointmentSpeciality speciality,
      DateTime? date,
      Name doctor,
      String location,
      String notes});
}

/// @nodoc
class _$AppointmentFormStateCopyWithImpl<$Res,
        $Val extends AppointmentFormState>
    implements $AppointmentFormStateCopyWith<$Res> {
  _$AppointmentFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? speciality = null,
    Object? date = freezed,
    Object? doctor = null,
    Object? location = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as AppointmentSpeciality,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Name,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentFormStateCopyWith<$Res>
    implements $AppointmentFormStateCopyWith<$Res> {
  factory _$$_AppointmentFormStateCopyWith(_$_AppointmentFormState value,
          $Res Function(_$_AppointmentFormState) then) =
      __$$_AppointmentFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name name,
      AppointmentSpeciality speciality,
      DateTime? date,
      Name doctor,
      String location,
      String notes});
}

/// @nodoc
class __$$_AppointmentFormStateCopyWithImpl<$Res>
    extends _$AppointmentFormStateCopyWithImpl<$Res, _$_AppointmentFormState>
    implements _$$_AppointmentFormStateCopyWith<$Res> {
  __$$_AppointmentFormStateCopyWithImpl(_$_AppointmentFormState _value,
      $Res Function(_$_AppointmentFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? speciality = null,
    Object? date = freezed,
    Object? doctor = null,
    Object? location = null,
    Object? notes = null,
  }) {
    return _then(_$_AppointmentFormState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as AppointmentSpeciality,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Name,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppointmentFormState implements _AppointmentFormState {
  const _$_AppointmentFormState(
      {this.name = const Name.pure(),
      this.speciality = AppointmentSpeciality.cardiology,
      this.date,
      this.doctor = const Name.pure(),
      this.location = '',
      this.notes = ''});

  @override
  @JsonKey()
  final Name name;
  @override
  @JsonKey()
  final AppointmentSpeciality speciality;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final Name doctor;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'AppointmentFormState(name: $name, speciality: $speciality, date: $date, doctor: $doctor, location: $location, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentFormState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, speciality, date, doctor, location, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentFormStateCopyWith<_$_AppointmentFormState> get copyWith =>
      __$$_AppointmentFormStateCopyWithImpl<_$_AppointmentFormState>(
          this, _$identity);
}

abstract class _AppointmentFormState implements AppointmentFormState {
  const factory _AppointmentFormState(
      {final Name name,
      final AppointmentSpeciality speciality,
      final DateTime? date,
      final Name doctor,
      final String location,
      final String notes}) = _$_AppointmentFormState;

  @override
  Name get name;
  @override
  AppointmentSpeciality get speciality;
  @override
  DateTime? get date;
  @override
  Name get doctor;
  @override
  String get location;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentFormStateCopyWith<_$_AppointmentFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
