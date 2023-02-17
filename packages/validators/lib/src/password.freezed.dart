// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
    TResult? Function()? tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidPasswordError value) invalid,
    required TResult Function(EmptyPasswordError value) empty,
    required TResult Function(TooShortPasswordError value) tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidPasswordError value)? invalid,
    TResult? Function(EmptyPasswordError value)? empty,
    TResult? Function(TooShortPasswordError value)? tooShort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPasswordError value)? invalid,
    TResult Function(EmptyPasswordError value)? empty,
    TResult Function(TooShortPasswordError value)? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordErrorCopyWith<$Res> {
  factory $PasswordErrorCopyWith(
          PasswordError value, $Res Function(PasswordError) then) =
      _$PasswordErrorCopyWithImpl<$Res, PasswordError>;
}

/// @nodoc
class _$PasswordErrorCopyWithImpl<$Res, $Val extends PasswordError>
    implements $PasswordErrorCopyWith<$Res> {
  _$PasswordErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidPasswordErrorCopyWith<$Res> {
  factory _$$InvalidPasswordErrorCopyWith(_$InvalidPasswordError value,
          $Res Function(_$InvalidPasswordError) then) =
      __$$InvalidPasswordErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidPasswordErrorCopyWithImpl<$Res>
    extends _$PasswordErrorCopyWithImpl<$Res, _$InvalidPasswordError>
    implements _$$InvalidPasswordErrorCopyWith<$Res> {
  __$$InvalidPasswordErrorCopyWithImpl(_$InvalidPasswordError _value,
      $Res Function(_$InvalidPasswordError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidPasswordError implements InvalidPasswordError {
  const _$InvalidPasswordError();

  @override
  String toString() {
    return 'PasswordError.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidPasswordError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
    TResult? Function()? tooShort,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
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
    required TResult Function(InvalidPasswordError value) invalid,
    required TResult Function(EmptyPasswordError value) empty,
    required TResult Function(TooShortPasswordError value) tooShort,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidPasswordError value)? invalid,
    TResult? Function(EmptyPasswordError value)? empty,
    TResult? Function(TooShortPasswordError value)? tooShort,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPasswordError value)? invalid,
    TResult Function(EmptyPasswordError value)? empty,
    TResult Function(TooShortPasswordError value)? tooShort,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class InvalidPasswordError implements PasswordError {
  const factory InvalidPasswordError() = _$InvalidPasswordError;
}

/// @nodoc
abstract class _$$EmptyPasswordErrorCopyWith<$Res> {
  factory _$$EmptyPasswordErrorCopyWith(_$EmptyPasswordError value,
          $Res Function(_$EmptyPasswordError) then) =
      __$$EmptyPasswordErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyPasswordErrorCopyWithImpl<$Res>
    extends _$PasswordErrorCopyWithImpl<$Res, _$EmptyPasswordError>
    implements _$$EmptyPasswordErrorCopyWith<$Res> {
  __$$EmptyPasswordErrorCopyWithImpl(
      _$EmptyPasswordError _value, $Res Function(_$EmptyPasswordError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyPasswordError implements EmptyPasswordError {
  const _$EmptyPasswordError();

  @override
  String toString() {
    return 'PasswordError.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyPasswordError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
    TResult? Function()? tooShort,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
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
    required TResult Function(InvalidPasswordError value) invalid,
    required TResult Function(EmptyPasswordError value) empty,
    required TResult Function(TooShortPasswordError value) tooShort,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidPasswordError value)? invalid,
    TResult? Function(EmptyPasswordError value)? empty,
    TResult? Function(TooShortPasswordError value)? tooShort,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPasswordError value)? invalid,
    TResult Function(EmptyPasswordError value)? empty,
    TResult Function(TooShortPasswordError value)? tooShort,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyPasswordError implements PasswordError {
  const factory EmptyPasswordError() = _$EmptyPasswordError;
}

/// @nodoc
abstract class _$$TooShortPasswordErrorCopyWith<$Res> {
  factory _$$TooShortPasswordErrorCopyWith(_$TooShortPasswordError value,
          $Res Function(_$TooShortPasswordError) then) =
      __$$TooShortPasswordErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TooShortPasswordErrorCopyWithImpl<$Res>
    extends _$PasswordErrorCopyWithImpl<$Res, _$TooShortPasswordError>
    implements _$$TooShortPasswordErrorCopyWith<$Res> {
  __$$TooShortPasswordErrorCopyWithImpl(_$TooShortPasswordError _value,
      $Res Function(_$TooShortPasswordError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TooShortPasswordError implements TooShortPasswordError {
  const _$TooShortPasswordError();

  @override
  String toString() {
    return 'PasswordError.tooShort()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TooShortPasswordError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return tooShort();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? empty,
    TResult? Function()? tooShort,
  }) {
    return tooShort?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
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
    required TResult Function(InvalidPasswordError value) invalid,
    required TResult Function(EmptyPasswordError value) empty,
    required TResult Function(TooShortPasswordError value) tooShort,
  }) {
    return tooShort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidPasswordError value)? invalid,
    TResult? Function(EmptyPasswordError value)? empty,
    TResult? Function(TooShortPasswordError value)? tooShort,
  }) {
    return tooShort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPasswordError value)? invalid,
    TResult Function(EmptyPasswordError value)? empty,
    TResult Function(TooShortPasswordError value)? tooShort,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class TooShortPasswordError implements PasswordError {
  const factory TooShortPasswordError() = _$TooShortPasswordError;
}
