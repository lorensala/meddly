// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SetupState {
  Name get name => throw _privateConstructorUsedError;
  Lastname get lastname => throw _privateConstructorUsedError;
  Height get height => throw _privateConstructorUsedError;
  Weight get weight => throw _privateConstructorUsedError;
  SexInput get sex => throw _privateConstructorUsedError;
  Birthdate get birthdate => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetupStateCopyWith<SetupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupStateCopyWith<$Res> {
  factory $SetupStateCopyWith(
          SetupState value, $Res Function(SetupState) then) =
      _$SetupStateCopyWithImpl<$Res, SetupState>;
  @useResult
  $Res call(
      {Name name,
      Lastname lastname,
      Height height,
      Weight weight,
      SexInput sex,
      Birthdate birthdate,
      FormzStatus status});
}

/// @nodoc
class _$SetupStateCopyWithImpl<$Res, $Val extends SetupState>
    implements $SetupStateCopyWith<$Res> {
  _$SetupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lastname = null,
    Object? height = null,
    Object? weight = null,
    Object? sex = null,
    Object? birthdate = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as Lastname,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as Height,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Weight,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SexInput,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as Birthdate,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SetupStateCopyWith<$Res>
    implements $SetupStateCopyWith<$Res> {
  factory _$$_SetupStateCopyWith(
          _$_SetupState value, $Res Function(_$_SetupState) then) =
      __$$_SetupStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name name,
      Lastname lastname,
      Height height,
      Weight weight,
      SexInput sex,
      Birthdate birthdate,
      FormzStatus status});
}

/// @nodoc
class __$$_SetupStateCopyWithImpl<$Res>
    extends _$SetupStateCopyWithImpl<$Res, _$_SetupState>
    implements _$$_SetupStateCopyWith<$Res> {
  __$$_SetupStateCopyWithImpl(
      _$_SetupState _value, $Res Function(_$_SetupState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lastname = null,
    Object? height = null,
    Object? weight = null,
    Object? sex = null,
    Object? birthdate = null,
    Object? status = freezed,
  }) {
    return _then(_$_SetupState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as Lastname,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as Height,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Weight,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SexInput,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as Birthdate,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_SetupState implements _SetupState {
  const _$_SetupState(
      {this.name = const Name.pure(),
      this.lastname = const Lastname.pure(),
      this.height = const Height.pure(),
      this.weight = const Weight.pure(),
      this.sex = const SexInput.pure(),
      this.birthdate = const Birthdate.pure(),
      this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final Name name;
  @override
  @JsonKey()
  final Lastname lastname;
  @override
  @JsonKey()
  final Height height;
  @override
  @JsonKey()
  final Weight weight;
  @override
  @JsonKey()
  final SexInput sex;
  @override
  @JsonKey()
  final Birthdate birthdate;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'SetupState(name: $name, lastname: $lastname, height: $height, weight: $weight, sex: $sex, birthdate: $birthdate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetupState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, lastname, height, weight,
      sex, birthdate, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetupStateCopyWith<_$_SetupState> get copyWith =>
      __$$_SetupStateCopyWithImpl<_$_SetupState>(this, _$identity);
}

abstract class _SetupState implements SetupState {
  const factory _SetupState(
      {final Name name,
      final Lastname lastname,
      final Height height,
      final Weight weight,
      final SexInput sex,
      final Birthdate birthdate,
      final FormzStatus status}) = _$_SetupState;

  @override
  Name get name;
  @override
  Lastname get lastname;
  @override
  Height get height;
  @override
  Weight get weight;
  @override
  SexInput get sex;
  @override
  Birthdate get birthdate;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_SetupStateCopyWith<_$_SetupState> get copyWith =>
      throw _privateConstructorUsedError;
}
