// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneEventCopyWith<$Res> {
  factory $PhoneEventCopyWith(
          PhoneEvent value, $Res Function(PhoneEvent) then) =
      _$PhoneEventCopyWithImpl<$Res, PhoneEvent>;
}

/// @nodoc
class _$PhoneEventCopyWithImpl<$Res, $Val extends PhoneEvent>
    implements $PhoneEventCopyWith<$Res> {
  _$PhoneEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendPhoneNumberCopyWith<$Res> {
  factory _$$_SendPhoneNumberCopyWith(
          _$_SendPhoneNumber value, $Res Function(_$_SendPhoneNumber) then) =
      __$$_SendPhoneNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, int? forceResendingToken});
}

/// @nodoc
class __$$_SendPhoneNumberCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_SendPhoneNumber>
    implements _$$_SendPhoneNumberCopyWith<$Res> {
  __$$_SendPhoneNumberCopyWithImpl(
      _$_SendPhoneNumber _value, $Res Function(_$_SendPhoneNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? forceResendingToken = freezed,
  }) {
    return _then(_$_SendPhoneNumber(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SendPhoneNumber implements _SendPhoneNumber {
  const _$_SendPhoneNumber(
      {required this.phoneNumber, this.forceResendingToken});

  @override
  final String phoneNumber;
  @override
  final int? forceResendingToken;

  @override
  String toString() {
    return 'PhoneEvent.sendPhoneNumber(phoneNumber: $phoneNumber, forceResendingToken: $forceResendingToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendPhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, forceResendingToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendPhoneNumberCopyWith<_$_SendPhoneNumber> get copyWith =>
      __$$_SendPhoneNumberCopyWithImpl<_$_SendPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return sendPhoneNumber(phoneNumber, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return sendPhoneNumber?.call(phoneNumber, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (sendPhoneNumber != null) {
      return sendPhoneNumber(phoneNumber, forceResendingToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return sendPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return sendPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (sendPhoneNumber != null) {
      return sendPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _SendPhoneNumber implements PhoneEvent {
  const factory _SendPhoneNumber(
      {required final String phoneNumber,
      final int? forceResendingToken}) = _$_SendPhoneNumber;

  String get phoneNumber;
  int? get forceResendingToken;
  @JsonKey(ignore: true)
  _$$_SendPhoneNumberCopyWith<_$_SendPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyPhoneNumberCopyWith<$Res> {
  factory _$$_VerifyPhoneNumberCopyWith(_$_VerifyPhoneNumber value,
          $Res Function(_$_VerifyPhoneNumber) then) =
      __$$_VerifyPhoneNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String smsCode, String phoneNumber});
}

/// @nodoc
class __$$_VerifyPhoneNumberCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_VerifyPhoneNumber>
    implements _$$_VerifyPhoneNumberCopyWith<$Res> {
  __$$_VerifyPhoneNumberCopyWithImpl(
      _$_VerifyPhoneNumber _value, $Res Function(_$_VerifyPhoneNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? smsCode = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_VerifyPhoneNumber(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      smsCode: null == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyPhoneNumber implements _VerifyPhoneNumber {
  const _$_VerifyPhoneNumber(
      {required this.verificationId,
      required this.smsCode,
      required this.phoneNumber});

  @override
  final String verificationId;
  @override
  final String smsCode;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneEvent.verifyPhoneNumber(verificationId: $verificationId, smsCode: $smsCode, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyPhoneNumber &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, smsCode, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyPhoneNumberCopyWith<_$_VerifyPhoneNumber> get copyWith =>
      __$$_VerifyPhoneNumberCopyWithImpl<_$_VerifyPhoneNumber>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return verifyPhoneNumber(verificationId, smsCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return verifyPhoneNumber?.call(verificationId, smsCode, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verifyPhoneNumber != null) {
      return verifyPhoneNumber(verificationId, smsCode, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return verifyPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return verifyPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verifyPhoneNumber != null) {
      return verifyPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _VerifyPhoneNumber implements PhoneEvent {
  const factory _VerifyPhoneNumber(
      {required final String verificationId,
      required final String smsCode,
      required final String phoneNumber}) = _$_VerifyPhoneNumber;

  String get verificationId;
  String get smsCode;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_VerifyPhoneNumberCopyWith<_$_VerifyPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerificationCompletedCopyWith<$Res> {
  factory _$$_VerificationCompletedCopyWith(_$_VerificationCompleted value,
          $Res Function(_$_VerificationCompleted) then) =
      __$$_VerificationCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({PhoneAuthCredential phoneAuthCredential, String phoneNumber});
}

/// @nodoc
class __$$_VerificationCompletedCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_VerificationCompleted>
    implements _$$_VerificationCompletedCopyWith<$Res> {
  __$$_VerificationCompletedCopyWithImpl(_$_VerificationCompleted _value,
      $Res Function(_$_VerificationCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneAuthCredential = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_VerificationCompleted(
      phoneAuthCredential: null == phoneAuthCredential
          ? _value.phoneAuthCredential
          : phoneAuthCredential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerificationCompleted implements _VerificationCompleted {
  const _$_VerificationCompleted(
      {required this.phoneAuthCredential, required this.phoneNumber});

  @override
  final PhoneAuthCredential phoneAuthCredential;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneEvent.verificationCompleted(phoneAuthCredential: $phoneAuthCredential, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerificationCompleted &&
            (identical(other.phoneAuthCredential, phoneAuthCredential) ||
                other.phoneAuthCredential == phoneAuthCredential) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneAuthCredential, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerificationCompletedCopyWith<_$_VerificationCompleted> get copyWith =>
      __$$_VerificationCompletedCopyWithImpl<_$_VerificationCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted(phoneAuthCredential, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted?.call(phoneAuthCredential, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(phoneAuthCredential, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(this);
    }
    return orElse();
  }
}

abstract class _VerificationCompleted implements PhoneEvent {
  const factory _VerificationCompleted(
      {required final PhoneAuthCredential phoneAuthCredential,
      required final String phoneNumber}) = _$_VerificationCompleted;

  PhoneAuthCredential get phoneAuthCredential;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_VerificationCompletedCopyWith<_$_VerificationCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerificationFailedCopyWith<$Res> {
  factory _$$_VerificationFailedCopyWith(_$_VerificationFailed value,
          $Res Function(_$_VerificationFailed) then) =
      __$$_VerificationFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseAuthException firebaseAuthException});
}

/// @nodoc
class __$$_VerificationFailedCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_VerificationFailed>
    implements _$$_VerificationFailedCopyWith<$Res> {
  __$$_VerificationFailedCopyWithImpl(
      _$_VerificationFailed _value, $Res Function(_$_VerificationFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseAuthException = null,
  }) {
    return _then(_$_VerificationFailed(
      firebaseAuthException: null == firebaseAuthException
          ? _value.firebaseAuthException
          : firebaseAuthException // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException,
    ));
  }
}

/// @nodoc

class _$_VerificationFailed implements _VerificationFailed {
  const _$_VerificationFailed({required this.firebaseAuthException});

  @override
  final FirebaseAuthException firebaseAuthException;

  @override
  String toString() {
    return 'PhoneEvent.verificationFailed(firebaseAuthException: $firebaseAuthException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerificationFailed &&
            (identical(other.firebaseAuthException, firebaseAuthException) ||
                other.firebaseAuthException == firebaseAuthException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firebaseAuthException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerificationFailedCopyWith<_$_VerificationFailed> get copyWith =>
      __$$_VerificationFailedCopyWithImpl<_$_VerificationFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return verificationFailed(firebaseAuthException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return verificationFailed?.call(firebaseAuthException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(firebaseAuthException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return verificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class _VerificationFailed implements PhoneEvent {
  const factory _VerificationFailed(
          {required final FirebaseAuthException firebaseAuthException}) =
      _$_VerificationFailed;

  FirebaseAuthException get firebaseAuthException;
  @JsonKey(ignore: true)
  _$$_VerificationFailedCopyWith<_$_VerificationFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CodeSentCopyWith<$Res> {
  factory _$$_CodeSentCopyWith(
          _$_CodeSent value, $Res Function(_$_CodeSent) then) =
      __$$_CodeSentCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, int? forceResendingToken});
}

/// @nodoc
class __$$_CodeSentCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_CodeSent>
    implements _$$_CodeSentCopyWith<$Res> {
  __$$_CodeSentCopyWithImpl(
      _$_CodeSent _value, $Res Function(_$_CodeSent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? forceResendingToken = freezed,
  }) {
    return _then(_$_CodeSent(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_CodeSent implements _CodeSent {
  const _$_CodeSent(
      {required this.verificationId, required this.forceResendingToken});

  @override
  final String verificationId;
  @override
  final int? forceResendingToken;

  @override
  String toString() {
    return 'PhoneEvent.codeSent(verificationId: $verificationId, forceResendingToken: $forceResendingToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeSent &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, forceResendingToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeSentCopyWith<_$_CodeSent> get copyWith =>
      __$$_CodeSentCopyWithImpl<_$_CodeSent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return codeSent(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return codeSent?.call(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(verificationId, forceResendingToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return codeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class _CodeSent implements PhoneEvent {
  const factory _CodeSent(
      {required final String verificationId,
      required final int? forceResendingToken}) = _$_CodeSent;

  String get verificationId;
  int? get forceResendingToken;
  @JsonKey(ignore: true)
  _$$_CodeSentCopyWith<_$_CodeSent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CodeAutoRetrievalTimeoutCopyWith<$Res> {
  factory _$$_CodeAutoRetrievalTimeoutCopyWith(
          _$_CodeAutoRetrievalTimeout value,
          $Res Function(_$_CodeAutoRetrievalTimeout) then) =
      __$$_CodeAutoRetrievalTimeoutCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId});
}

/// @nodoc
class __$$_CodeAutoRetrievalTimeoutCopyWithImpl<$Res>
    extends _$PhoneEventCopyWithImpl<$Res, _$_CodeAutoRetrievalTimeout>
    implements _$$_CodeAutoRetrievalTimeoutCopyWith<$Res> {
  __$$_CodeAutoRetrievalTimeoutCopyWithImpl(_$_CodeAutoRetrievalTimeout _value,
      $Res Function(_$_CodeAutoRetrievalTimeout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
  }) {
    return _then(_$_CodeAutoRetrievalTimeout(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CodeAutoRetrievalTimeout implements _CodeAutoRetrievalTimeout {
  const _$_CodeAutoRetrievalTimeout({required this.verificationId});

  @override
  final String verificationId;

  @override
  String toString() {
    return 'PhoneEvent.codeAutoRetrievalTimeout(verificationId: $verificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeAutoRetrievalTimeout &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeAutoRetrievalTimeoutCopyWith<_$_CodeAutoRetrievalTimeout>
      get copyWith => __$$_CodeAutoRetrievalTimeoutCopyWithImpl<
          _$_CodeAutoRetrievalTimeout>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, int? forceResendingToken)
        sendPhoneNumber,
    required TResult Function(
            String verificationId, String smsCode, String phoneNumber)
        verifyPhoneNumber,
    required TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)
        verificationCompleted,
    required TResult Function(FirebaseAuthException firebaseAuthException)
        verificationFailed,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout(verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult? Function(
            String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult? Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult? Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout?.call(verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, int? forceResendingToken)?
        sendPhoneNumber,
    TResult Function(String verificationId, String smsCode, String phoneNumber)?
        verifyPhoneNumber,
    TResult Function(
            PhoneAuthCredential phoneAuthCredential, String phoneNumber)?
        verificationCompleted,
    TResult Function(FirebaseAuthException firebaseAuthException)?
        verificationFailed,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendPhoneNumber value) sendPhoneNumber,
    required TResult Function(_VerifyPhoneNumber value) verifyPhoneNumber,
    required TResult Function(_VerificationCompleted value)
        verificationCompleted,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult? Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult? Function(_VerificationCompleted value)? verificationCompleted,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_CodeAutoRetrievalTimeout value)?
        codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendPhoneNumber value)? sendPhoneNumber,
    TResult Function(_VerifyPhoneNumber value)? verifyPhoneNumber,
    TResult Function(_VerificationCompleted value)? verificationCompleted,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(this);
    }
    return orElse();
  }
}

abstract class _CodeAutoRetrievalTimeout implements PhoneEvent {
  const factory _CodeAutoRetrievalTimeout(
      {required final String verificationId}) = _$_CodeAutoRetrievalTimeout;

  String get verificationId;
  @JsonKey(ignore: true)
  _$$_CodeAutoRetrievalTimeoutCopyWith<_$_CodeAutoRetrievalTimeout>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhoneState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneStateCopyWith<$Res> {
  factory $PhoneStateCopyWith(
          PhoneState value, $Res Function(PhoneState) then) =
      _$PhoneStateCopyWithImpl<$Res, PhoneState>;
}

/// @nodoc
class _$PhoneStateCopyWithImpl<$Res, $Val extends PhoneState>
    implements $PhoneStateCopyWith<$Res> {
  _$PhoneStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'PhoneState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PhoneState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'PhoneState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends PhoneState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_CodeSentSuccessCopyWith<$Res> {
  factory _$$_CodeSentSuccessCopyWith(
          _$_CodeSentSuccess value, $Res Function(_$_CodeSentSuccess) then) =
      __$$_CodeSentSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, int? forceResendingToken});
}

/// @nodoc
class __$$_CodeSentSuccessCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$_CodeSentSuccess>
    implements _$$_CodeSentSuccessCopyWith<$Res> {
  __$$_CodeSentSuccessCopyWithImpl(
      _$_CodeSentSuccess _value, $Res Function(_$_CodeSentSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? forceResendingToken = freezed,
  }) {
    return _then(_$_CodeSentSuccess(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_CodeSentSuccess extends _CodeSentSuccess {
  const _$_CodeSentSuccess(
      {required this.verificationId, this.forceResendingToken})
      : super._();

  @override
  final String verificationId;
  @override
  final int? forceResendingToken;

  @override
  String toString() {
    return 'PhoneState.codeSentSuccess(verificationId: $verificationId, forceResendingToken: $forceResendingToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeSentSuccess &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, forceResendingToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeSentSuccessCopyWith<_$_CodeSentSuccess> get copyWith =>
      __$$_CodeSentSuccessCopyWithImpl<_$_CodeSentSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) {
    return codeSentSuccess(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) {
    return codeSentSuccess?.call(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) {
    if (codeSentSuccess != null) {
      return codeSentSuccess(verificationId, forceResendingToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) {
    return codeSentSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) {
    return codeSentSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (codeSentSuccess != null) {
      return codeSentSuccess(this);
    }
    return orElse();
  }
}

abstract class _CodeSentSuccess extends PhoneState {
  const factory _CodeSentSuccess(
      {required final String verificationId,
      final int? forceResendingToken}) = _$_CodeSentSuccess;
  const _CodeSentSuccess._() : super._();

  String get verificationId;
  int? get forceResendingToken;
  @JsonKey(ignore: true)
  _$$_CodeSentSuccessCopyWith<_$_CodeSentSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerificatedCopyWith<$Res> {
  factory _$$_VerificatedCopyWith(
          _$_Verificated value, $Res Function(_$_Verificated) then) =
      __$$_VerificatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VerificatedCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$_Verificated>
    implements _$$_VerificatedCopyWith<$Res> {
  __$$_VerificatedCopyWithImpl(
      _$_Verificated _value, $Res Function(_$_Verificated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Verificated extends _Verificated {
  const _$_Verificated() : super._();

  @override
  String toString() {
    return 'PhoneState.verificated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Verificated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) {
    return verificated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) {
    return verificated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) {
    if (verificated != null) {
      return verificated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) {
    return verificated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) {
    return verificated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verificated != null) {
      return verificated(this);
    }
    return orElse();
  }
}

abstract class _Verificated extends PhoneState {
  const factory _Verificated() = _$_Verificated;
  const _Verificated._() : super._();
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$PhoneStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? failure = null,
  }) {
    return _then(_$_Error(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res> get failure {
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error({required this.verificationId, required this.failure})
      : super._();

  @override
  final String verificationId;
  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'PhoneState.error(verificationId: $verificationId, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSentSuccess,
    required TResult Function() verificated,
    required TResult Function(String verificationId, AuthFailure failure) error,
  }) {
    return error(verificationId, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult? Function()? verificated,
    TResult? Function(String verificationId, AuthFailure failure)? error,
  }) {
    return error?.call(verificationId, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String verificationId, int? forceResendingToken)?
        codeSentSuccess,
    TResult Function()? verificated,
    TResult Function(String verificationId, AuthFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(verificationId, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CodeSentSuccess value) codeSentSuccess,
    required TResult Function(_Verificated value) verificated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(_Verificated value)? verificated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CodeSentSuccess value)? codeSentSuccess,
    TResult Function(_Verificated value)? verificated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends PhoneState {
  const factory _Error(
      {required final String verificationId,
      required final AuthFailure failure}) = _$_Error;
  const _Error._() : super._();

  String get verificationId;
  AuthFailure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
