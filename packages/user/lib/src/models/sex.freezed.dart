// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Sex {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() male,
    required TResult Function() female,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? male,
    TResult? Function()? female,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? male,
    TResult Function()? female,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Male value) male,
    required TResult Function(Female value) female,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Male value)? male,
    TResult? Function(Female value)? female,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Male value)? male,
    TResult Function(Female value)? female,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SexCopyWith<$Res> {
  factory $SexCopyWith(Sex value, $Res Function(Sex) then) =
      _$SexCopyWithImpl<$Res, Sex>;
}

/// @nodoc
class _$SexCopyWithImpl<$Res, $Val extends Sex> implements $SexCopyWith<$Res> {
  _$SexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MaleCopyWith<$Res> {
  factory _$$MaleCopyWith(_$Male value, $Res Function(_$Male) then) =
      __$$MaleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MaleCopyWithImpl<$Res> extends _$SexCopyWithImpl<$Res, _$Male>
    implements _$$MaleCopyWith<$Res> {
  __$$MaleCopyWithImpl(_$Male _value, $Res Function(_$Male) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Male extends Male {
  const _$Male() : super._();

  @override
  String toString() {
    return 'Sex.male()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Male);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() male,
    required TResult Function() female,
  }) {
    return male();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? male,
    TResult? Function()? female,
  }) {
    return male?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? male,
    TResult Function()? female,
    required TResult orElse(),
  }) {
    if (male != null) {
      return male();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Male value) male,
    required TResult Function(Female value) female,
  }) {
    return male(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Male value)? male,
    TResult? Function(Female value)? female,
  }) {
    return male?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Male value)? male,
    TResult Function(Female value)? female,
    required TResult orElse(),
  }) {
    if (male != null) {
      return male(this);
    }
    return orElse();
  }
}

abstract class Male extends Sex {
  const factory Male() = _$Male;
  const Male._() : super._();
}

/// @nodoc
abstract class _$$FemaleCopyWith<$Res> {
  factory _$$FemaleCopyWith(_$Female value, $Res Function(_$Female) then) =
      __$$FemaleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FemaleCopyWithImpl<$Res> extends _$SexCopyWithImpl<$Res, _$Female>
    implements _$$FemaleCopyWith<$Res> {
  __$$FemaleCopyWithImpl(_$Female _value, $Res Function(_$Female) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Female extends Female {
  const _$Female() : super._();

  @override
  String toString() {
    return 'Sex.female()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Female);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() male,
    required TResult Function() female,
  }) {
    return female();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? male,
    TResult? Function()? female,
  }) {
    return female?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? male,
    TResult Function()? female,
    required TResult orElse(),
  }) {
    if (female != null) {
      return female();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Male value) male,
    required TResult Function(Female value) female,
  }) {
    return female(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Male value)? male,
    TResult? Function(Female value)? female,
  }) {
    return female?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Male value)? male,
    TResult Function(Female value)? female,
    required TResult orElse(),
  }) {
    if (female != null) {
      return female(this);
    }
    return orElse();
  }
}

abstract class Female extends Sex {
  const factory Female() = _$Female;
  const Female._() : super._();
}
