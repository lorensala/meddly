// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeasurementFormState {
  MeasurementType get type => throw _privateConstructorUsedError;
  NotNegativeIntNumber get value => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  MeasurementFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeasurementFormStateCopyWith<MeasurementFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementFormStateCopyWith<$Res> {
  factory $MeasurementFormStateCopyWith(MeasurementFormState value,
          $Res Function(MeasurementFormState) then) =
      _$MeasurementFormStateCopyWithImpl<$Res, MeasurementFormState>;
  @useResult
  $Res call(
      {MeasurementType type,
      NotNegativeIntNumber value,
      DateTime? date,
      FormzStatus status,
      MeasurementFailure? failure});

  $MeasurementFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$MeasurementFormStateCopyWithImpl<$Res,
        $Val extends MeasurementFormState>
    implements $MeasurementFormStateCopyWith<$Res> {
  _$MeasurementFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
    Object? date = freezed,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MeasurementType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NotNegativeIntNumber,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as MeasurementFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $MeasurementFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $MeasurementFormStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MeasurementType type,
      NotNegativeIntNumber value,
      DateTime? date,
      FormzStatus status,
      MeasurementFailure? failure});

  @override
  $MeasurementFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MeasurementFormStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
    Object? date = freezed,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_$_Initial(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MeasurementType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NotNegativeIntNumber,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as MeasurementFailure?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.type = MeasurementType.bloodGlucose,
      this.value = const NotNegativeIntNumber.pure(),
      this.date,
      this.status = FormzStatus.pure,
      this.failure});

  @override
  @JsonKey()
  final MeasurementType type;
  @override
  @JsonKey()
  final NotNegativeIntNumber value;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final MeasurementFailure? failure;

  @override
  String toString() {
    return 'MeasurementFormState(type: $type, value: $value, date: $date, status: $status, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, value, date, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements MeasurementFormState {
  const factory _Initial(
      {final MeasurementType type,
      final NotNegativeIntNumber value,
      final DateTime? date,
      final FormzStatus status,
      final MeasurementFailure? failure}) = _$_Initial;

  @override
  MeasurementType get type;
  @override
  NotNegativeIntNumber get value;
  @override
  DateTime? get date;
  @override
  FormzStatus get status;
  @override
  MeasurementFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
