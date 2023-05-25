// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailError value) invalid,
    required TResult Function(EmptyEmailError value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmailError value)? invalid,
    TResult? Function(EmptyEmailError value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailError value)? invalid,
    TResult Function(EmptyEmailError value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailErrorCopyWith<$Res> {
  factory $EmailErrorCopyWith(
          EmailError value, $Res Function(EmailError) then) =
      _$EmailErrorCopyWithImpl<$Res, EmailError>;
}

/// @nodoc
class _$EmailErrorCopyWithImpl<$Res, $Val extends EmailError>
    implements $EmailErrorCopyWith<$Res> {
  _$EmailErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidEmailErrorCopyWith<$Res> {
  factory _$$InvalidEmailErrorCopyWith(
          _$InvalidEmailError value, $Res Function(_$InvalidEmailError) then) =
      __$$InvalidEmailErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailErrorCopyWithImpl<$Res>
    extends _$EmailErrorCopyWithImpl<$Res, _$InvalidEmailError>
    implements _$$InvalidEmailErrorCopyWith<$Res> {
  __$$InvalidEmailErrorCopyWithImpl(
      _$InvalidEmailError _value, $Res Function(_$InvalidEmailError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmailError implements InvalidEmailError {
  const _$InvalidEmailError();

  @override
  String toString() {
    return 'EmailError.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmailError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
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
    required TResult Function(InvalidEmailError value) invalid,
    required TResult Function(EmptyEmailError value) empty,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmailError value)? invalid,
    TResult? Function(EmptyEmailError value)? empty,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailError value)? invalid,
    TResult Function(EmptyEmailError value)? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailError implements EmailError {
  const factory InvalidEmailError() = _$InvalidEmailError;
}

/// @nodoc
abstract class _$$EmptyEmailErrorCopyWith<$Res> {
  factory _$$EmptyEmailErrorCopyWith(
          _$EmptyEmailError value, $Res Function(_$EmptyEmailError) then) =
      __$$EmptyEmailErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyEmailErrorCopyWithImpl<$Res>
    extends _$EmailErrorCopyWithImpl<$Res, _$EmptyEmailError>
    implements _$$EmptyEmailErrorCopyWith<$Res> {
  __$$EmptyEmailErrorCopyWithImpl(
      _$EmptyEmailError _value, $Res Function(_$EmptyEmailError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyEmailError implements EmptyEmailError {
  const _$EmptyEmailError();

  @override
  String toString() {
    return 'EmailError.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyEmailError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
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
    required TResult Function(InvalidEmailError value) invalid,
    required TResult Function(EmptyEmailError value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmailError value)? invalid,
    TResult? Function(EmptyEmailError value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailError value)? invalid,
    TResult Function(EmptyEmailError value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyEmailError implements EmailError {
  const factory EmptyEmailError() = _$EmptyEmailError;
}
