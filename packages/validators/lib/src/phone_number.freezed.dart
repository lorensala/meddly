// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneNumberError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberErrorCopyWith<$Res> {
  factory $PhoneNumberErrorCopyWith(
          PhoneNumberError value, $Res Function(PhoneNumberError) then) =
      _$PhoneNumberErrorCopyWithImpl<$Res, PhoneNumberError>;
}

/// @nodoc
class _$PhoneNumberErrorCopyWithImpl<$Res, $Val extends PhoneNumberError>
    implements $PhoneNumberErrorCopyWith<$Res> {
  _$PhoneNumberErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InvalidCopyWith<$Res> {
  factory _$$_InvalidCopyWith(
          _$_Invalid value, $Res Function(_$_Invalid) then) =
      __$$_InvalidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidCopyWithImpl<$Res>
    extends _$PhoneNumberErrorCopyWithImpl<$Res, _$_Invalid>
    implements _$$_InvalidCopyWith<$Res> {
  __$$_InvalidCopyWithImpl(_$_Invalid _value, $Res Function(_$_Invalid) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Invalid implements _Invalid {
  const _$_Invalid();

  @override
  String toString() {
    return 'PhoneNumberError.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Invalid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Invalid implements PhoneNumberError {
  const factory _Invalid() = _$_Invalid;
}

/// @nodoc
abstract class _$$_TooShortCopyWith<$Res> {
  factory _$$_TooShortCopyWith(
          _$_TooShort value, $Res Function(_$_TooShort) then) =
      __$$_TooShortCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TooShortCopyWithImpl<$Res>
    extends _$PhoneNumberErrorCopyWithImpl<$Res, _$_TooShort>
    implements _$$_TooShortCopyWith<$Res> {
  __$$_TooShortCopyWithImpl(
      _$_TooShort _value, $Res Function(_$_TooShort) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TooShort implements _TooShort {
  const _$_TooShort();

  @override
  String toString() {
    return 'PhoneNumberError.tooShort()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TooShort);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) {
    return tooShort();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) {
    return tooShort?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) {
    return tooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) {
    return tooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class _TooShort implements PhoneNumberError {
  const factory _TooShort() = _$_TooShort;
}

/// @nodoc
abstract class _$$_TooLongCopyWith<$Res> {
  factory _$$_TooLongCopyWith(
          _$_TooLong value, $Res Function(_$_TooLong) then) =
      __$$_TooLongCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TooLongCopyWithImpl<$Res>
    extends _$PhoneNumberErrorCopyWithImpl<$Res, _$_TooLong>
    implements _$$_TooLongCopyWith<$Res> {
  __$$_TooLongCopyWithImpl(_$_TooLong _value, $Res Function(_$_TooLong) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TooLong implements _TooLong {
  const _$_TooLong();

  @override
  String toString() {
    return 'PhoneNumberError.tooLong()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TooLong);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) {
    return tooLong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) {
    return tooLong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) {
    return tooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) {
    return tooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(this);
    }
    return orElse();
  }
}

abstract class _TooLong implements PhoneNumberError {
  const factory _TooLong() = _$_TooLong;
}

/// @nodoc
abstract class _$$_NotNumericCopyWith<$Res> {
  factory _$$_NotNumericCopyWith(
          _$_NotNumeric value, $Res Function(_$_NotNumeric) then) =
      __$$_NotNumericCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotNumericCopyWithImpl<$Res>
    extends _$PhoneNumberErrorCopyWithImpl<$Res, _$_NotNumeric>
    implements _$$_NotNumericCopyWith<$Res> {
  __$$_NotNumericCopyWithImpl(
      _$_NotNumeric _value, $Res Function(_$_NotNumeric) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotNumeric implements _NotNumeric {
  const _$_NotNumeric();

  @override
  String toString() {
    return 'PhoneNumberError.notNumeric()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotNumeric);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) {
    return notNumeric();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) {
    return notNumeric?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (notNumeric != null) {
      return notNumeric();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) {
    return notNumeric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) {
    return notNumeric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (notNumeric != null) {
      return notNumeric(this);
    }
    return orElse();
  }
}

abstract class _NotNumeric implements PhoneNumberError {
  const factory _NotNumeric() = _$_NotNumeric;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$PhoneNumberErrorCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'PhoneNumberError.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooShort,
    required TResult Function() tooLong,
    required TResult Function() notNumeric,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooShort,
    TResult? Function()? tooLong,
    TResult? Function()? notNumeric,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooShort,
    TResult Function()? tooLong,
    TResult Function()? notNumeric,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_TooShort value) tooShort,
    required TResult Function(_TooLong value) tooLong,
    required TResult Function(_NotNumeric value) notNumeric,
    required TResult Function(_Empty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_TooShort value)? tooShort,
    TResult? Function(_TooLong value)? tooLong,
    TResult? Function(_NotNumeric value)? notNumeric,
    TResult? Function(_Empty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Invalid value)? invalid,
    TResult Function(_TooShort value)? tooShort,
    TResult Function(_TooLong value)? tooLong,
    TResult Function(_NotNumeric value)? notNumeric,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements PhoneNumberError {
  const factory _Empty() = _$_Empty;
}
