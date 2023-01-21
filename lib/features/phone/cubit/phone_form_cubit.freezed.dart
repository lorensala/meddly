// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneFormState {
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  AuthFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneFormStateCopyWith<PhoneFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneFormStateCopyWith<$Res> {
  factory $PhoneFormStateCopyWith(
          PhoneFormState value, $Res Function(PhoneFormState) then) =
      _$PhoneFormStateCopyWithImpl<$Res, PhoneFormState>;
  @useResult
  $Res call(
      {PhoneNumber phoneNumber, FormzStatus status, AuthFailure? failure});

  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$PhoneFormStateCopyWithImpl<$Res, $Val extends PhoneFormState>
    implements $PhoneFormStateCopyWith<$Res> {
  _$PhoneFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PhoneFormStateCopyWith<$Res>
    implements $PhoneFormStateCopyWith<$Res> {
  factory _$$_PhoneFormStateCopyWith(
          _$_PhoneFormState value, $Res Function(_$_PhoneFormState) then) =
      __$$_PhoneFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhoneNumber phoneNumber, FormzStatus status, AuthFailure? failure});

  @override
  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$_PhoneFormStateCopyWithImpl<$Res>
    extends _$PhoneFormStateCopyWithImpl<$Res, _$_PhoneFormState>
    implements _$$_PhoneFormStateCopyWith<$Res> {
  __$$_PhoneFormStateCopyWithImpl(
      _$_PhoneFormState _value, $Res Function(_$_PhoneFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_$_PhoneFormState(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ));
  }
}

/// @nodoc

class _$_PhoneFormState implements _PhoneFormState {
  const _$_PhoneFormState(
      {this.phoneNumber = const PhoneNumber.pure(),
      this.status = FormzStatus.pure,
      this.failure});

  @override
  @JsonKey()
  final PhoneNumber phoneNumber;
  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final AuthFailure? failure;

  @override
  String toString() {
    return 'PhoneFormState(phoneNumber: $phoneNumber, status: $status, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneFormState &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneFormStateCopyWith<_$_PhoneFormState> get copyWith =>
      __$$_PhoneFormStateCopyWithImpl<_$_PhoneFormState>(this, _$identity);
}

abstract class _PhoneFormState implements PhoneFormState {
  const factory _PhoneFormState(
      {final PhoneNumber phoneNumber,
      final FormzStatus status,
      final AuthFailure? failure}) = _$_PhoneFormState;

  @override
  PhoneNumber get phoneNumber;
  @override
  FormzStatus get status;
  @override
  AuthFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneFormStateCopyWith<_$_PhoneFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
