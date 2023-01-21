// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otp_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpFormState {
  Otp get otp => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpFormStateCopyWith<OtpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpFormStateCopyWith<$Res> {
  factory $OtpFormStateCopyWith(
          OtpFormState value, $Res Function(OtpFormState) then) =
      _$OtpFormStateCopyWithImpl<$Res, OtpFormState>;
  @useResult
  $Res call({Otp otp, FormzStatus status});
}

/// @nodoc
class _$OtpFormStateCopyWithImpl<$Res, $Val extends OtpFormState>
    implements $OtpFormStateCopyWith<$Res> {
  _$OtpFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpFormStateCopyWith<$Res>
    implements $OtpFormStateCopyWith<$Res> {
  factory _$$_OtpFormStateCopyWith(
          _$_OtpFormState value, $Res Function(_$_OtpFormState) then) =
      __$$_OtpFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Otp otp, FormzStatus status});
}

/// @nodoc
class __$$_OtpFormStateCopyWithImpl<$Res>
    extends _$OtpFormStateCopyWithImpl<$Res, _$_OtpFormState>
    implements _$$_OtpFormStateCopyWith<$Res> {
  __$$_OtpFormStateCopyWithImpl(
      _$_OtpFormState _value, $Res Function(_$_OtpFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? status = null,
  }) {
    return _then(_$_OtpFormState(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_OtpFormState implements _OtpFormState {
  const _$_OtpFormState(
      {this.otp = const Otp.pure(), this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final Otp otp;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'OtpFormState(otp: $otp, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpFormState &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpFormStateCopyWith<_$_OtpFormState> get copyWith =>
      __$$_OtpFormStateCopyWithImpl<_$_OtpFormState>(this, _$identity);
}

abstract class _OtpFormState implements OtpFormState {
  const factory _OtpFormState({final Otp otp, final FormzStatus status}) =
      _$_OtpFormState;

  @override
  Otp get otp;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_OtpFormStateCopyWith<_$_OtpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
