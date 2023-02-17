// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstructionsError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Invalid value) invalid,
    required TResult Function(TooLong value) tooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Invalid value)? invalid,
    TResult? Function(TooLong value)? tooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Invalid value)? invalid,
    TResult Function(TooLong value)? tooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionsErrorCopyWith<$Res> {
  factory $InstructionsErrorCopyWith(
          InstructionsError value, $Res Function(InstructionsError) then) =
      _$InstructionsErrorCopyWithImpl<$Res, InstructionsError>;
}

/// @nodoc
class _$InstructionsErrorCopyWithImpl<$Res, $Val extends InstructionsError>
    implements $InstructionsErrorCopyWith<$Res> {
  _$InstructionsErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidCopyWith<$Res> {
  factory _$$InvalidCopyWith(_$Invalid value, $Res Function(_$Invalid) then) =
      __$$InvalidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCopyWithImpl<$Res>
    extends _$InstructionsErrorCopyWithImpl<$Res, _$Invalid>
    implements _$$InvalidCopyWith<$Res> {
  __$$InvalidCopyWithImpl(_$Invalid _value, $Res Function(_$Invalid) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Invalid implements Invalid {
  const _$Invalid();

  @override
  String toString() {
    return 'InstructionsError.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Invalid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
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
    required TResult Function(Invalid value) invalid,
    required TResult Function(TooLong value) tooLong,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Invalid value)? invalid,
    TResult? Function(TooLong value)? tooLong,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Invalid value)? invalid,
    TResult Function(TooLong value)? tooLong,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class Invalid implements InstructionsError {
  const factory Invalid() = _$Invalid;
}

/// @nodoc
abstract class _$$TooLongCopyWith<$Res> {
  factory _$$TooLongCopyWith(_$TooLong value, $Res Function(_$TooLong) then) =
      __$$TooLongCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TooLongCopyWithImpl<$Res>
    extends _$InstructionsErrorCopyWithImpl<$Res, _$TooLong>
    implements _$$TooLongCopyWith<$Res> {
  __$$TooLongCopyWithImpl(_$TooLong _value, $Res Function(_$TooLong) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TooLong implements TooLong {
  const _$TooLong();

  @override
  String toString() {
    return 'InstructionsError.tooLong()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TooLong);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() tooLong,
  }) {
    return tooLong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalid,
    TResult? Function()? tooLong,
  }) {
    return tooLong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? tooLong,
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
    required TResult Function(Invalid value) invalid,
    required TResult Function(TooLong value) tooLong,
  }) {
    return tooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Invalid value)? invalid,
    TResult? Function(TooLong value)? tooLong,
  }) {
    return tooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Invalid value)? invalid,
    TResult Function(TooLong value)? tooLong,
    required TResult orElse(),
  }) {
    if (tooLong != null) {
      return tooLong(this);
    }
    return orElse();
  }
}

abstract class TooLong implements InstructionsError {
  const factory TooLong() = _$TooLong;
}
