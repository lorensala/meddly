// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NameError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidNameError value) invalid,
    required TResult Function(TooLongNameError value) tooLong,
    required TResult Function(EmptyNameError value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidNameError value)? invalid,
    TResult? Function(TooLongNameError value)? tooLong,
    TResult? Function(EmptyNameError value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidNameError value)? invalid,
    TResult Function(TooLongNameError value)? tooLong,
    TResult Function(EmptyNameError value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameErrorCopyWith<$Res> {
  factory $NameErrorCopyWith(NameError value, $Res Function(NameError) then) =
      _$NameErrorCopyWithImpl<$Res, NameError>;
}

/// @nodoc
class _$NameErrorCopyWithImpl<$Res, $Val extends NameError>
    implements $NameErrorCopyWith<$Res> {
  _$NameErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidNameErrorCopyWith<$Res> {
  factory _$$InvalidNameErrorCopyWith(
          _$InvalidNameError value, $Res Function(_$InvalidNameError) then) =
      __$$InvalidNameErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidNameErrorCopyWithImpl<$Res>
    extends _$NameErrorCopyWithImpl<$Res, _$InvalidNameError>
    implements _$$InvalidNameErrorCopyWith<$Res> {
  __$$InvalidNameErrorCopyWithImpl(
      _$InvalidNameError _value, $Res Function(_$InvalidNameError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidNameError implements InvalidNameError {
  const _$InvalidNameError();

  @override
  String toString() {
    return 'NameError.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidNameError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
    required TResult Function() empty,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
    TResult? Function()? empty,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
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
    required TResult Function(InvalidNameError value) invalid,
    required TResult Function(TooLongNameError value) tooLong,
    required TResult Function(EmptyNameError value) empty,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidNameError value)? invalid,
    TResult? Function(TooLongNameError value)? tooLong,
    TResult? Function(EmptyNameError value)? empty,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidNameError value)? invalid,
    TResult Function(TooLongNameError value)? tooLong,
    TResult Function(EmptyNameError value)? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class InvalidNameError implements NameError {
  const factory InvalidNameError() = _$InvalidNameError;
}

/// @nodoc
abstract class _$$TooLongNameErrorCopyWith<$Res> {
  factory _$$TooLongNameErrorCopyWith(
          _$TooLongNameError value, $Res Function(_$TooLongNameError) then) =
      __$$TooLongNameErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TooLongNameErrorCopyWithImpl<$Res>
    extends _$NameErrorCopyWithImpl<$Res, _$TooLongNameError>
    implements _$$TooLongNameErrorCopyWith<$Res> {
  __$$TooLongNameErrorCopyWithImpl(
      _$TooLongNameError _value, $Res Function(_$TooLongNameError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TooLongNameError implements TooLongNameError {
  const _$TooLongNameError();

  @override
  String toString() {
    return 'NameError.tooLong()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TooLongNameError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
    required TResult Function() empty,
  }) {
    return tooLong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
    TResult? Function()? empty,
  }) {
    return tooLong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
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
    required TResult Function(InvalidNameError value) invalid,
    required TResult Function(TooLongNameError value) tooLong,
    required TResult Function(EmptyNameError value) empty,
  }) {
    return tooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidNameError value)? invalid,
    TResult? Function(TooLongNameError value)? tooLong,
    TResult? Function(EmptyNameError value)? empty,
  }) {
    return tooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidNameError value)? invalid,
    TResult Function(TooLongNameError value)? tooLong,
    TResult Function(EmptyNameError value)? empty,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(this);
    }
    return orElse();
  }
}

abstract class TooLongNameError implements NameError {
  const factory TooLongNameError() = _$TooLongNameError;
}

/// @nodoc
abstract class _$$EmptyNameErrorCopyWith<$Res> {
  factory _$$EmptyNameErrorCopyWith(
          _$EmptyNameError value, $Res Function(_$EmptyNameError) then) =
      __$$EmptyNameErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyNameErrorCopyWithImpl<$Res>
    extends _$NameErrorCopyWithImpl<$Res, _$EmptyNameError>
    implements _$$EmptyNameErrorCopyWith<$Res> {
  __$$EmptyNameErrorCopyWithImpl(
      _$EmptyNameError _value, $Res Function(_$EmptyNameError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyNameError implements EmptyNameError {
  const _$EmptyNameError();

  @override
  String toString() {
    return 'NameError.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyNameError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
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
    required TResult Function(InvalidNameError value) invalid,
    required TResult Function(TooLongNameError value) tooLong,
    required TResult Function(EmptyNameError value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidNameError value)? invalid,
    TResult? Function(TooLongNameError value)? tooLong,
    TResult? Function(EmptyNameError value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidNameError value)? invalid,
    TResult Function(TooLongNameError value)? tooLong,
    TResult Function(EmptyNameError value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyNameError implements NameError {
  const factory EmptyNameError() = _$EmptyNameError;
}
