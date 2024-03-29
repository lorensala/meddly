// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeasurementState {
  int get id => throw _privateConstructorUsedError;
  NotNegativeIntNumber get value => throw _privateConstructorUsedError;
  MeasurementType get type => throw _privateConstructorUsedError;
  MeasurementUnit get unit => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeasurementStateCopyWith<MeasurementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementStateCopyWith<$Res> {
  factory $MeasurementStateCopyWith(
          MeasurementState value, $Res Function(MeasurementState) then) =
      _$MeasurementStateCopyWithImpl<$Res, MeasurementState>;
  @useResult
  $Res call(
      {int id,
      NotNegativeIntNumber value,
      MeasurementType type,
      MeasurementUnit unit,
      DateTime? date,
      bool isEditing,
      bool isNew});
}

/// @nodoc
class _$MeasurementStateCopyWithImpl<$Res, $Val extends MeasurementState>
    implements $MeasurementStateCopyWith<$Res> {
  _$MeasurementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
    Object? date = freezed,
    Object? isEditing = null,
    Object? isNew = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NotNegativeIntNumber,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MeasurementType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementStateCopyWith<$Res>
    implements $MeasurementStateCopyWith<$Res> {
  factory _$$_MeasurementStateCopyWith(
          _$_MeasurementState value, $Res Function(_$_MeasurementState) then) =
      __$$_MeasurementStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      NotNegativeIntNumber value,
      MeasurementType type,
      MeasurementUnit unit,
      DateTime? date,
      bool isEditing,
      bool isNew});
}

/// @nodoc
class __$$_MeasurementStateCopyWithImpl<$Res>
    extends _$MeasurementStateCopyWithImpl<$Res, _$_MeasurementState>
    implements _$$_MeasurementStateCopyWith<$Res> {
  __$$_MeasurementStateCopyWithImpl(
      _$_MeasurementState _value, $Res Function(_$_MeasurementState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
    Object? date = freezed,
    Object? isEditing = null,
    Object? isNew = null,
  }) {
    return _then(_$_MeasurementState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NotNegativeIntNumber,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MeasurementType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MeasurementState extends _MeasurementState {
  const _$_MeasurementState(
      {this.id = 0,
      this.value = const NotNegativeIntNumber.pure(),
      this.type = MeasurementType.bloodPressure,
      this.unit = MeasurementUnit.mmHg,
      this.date,
      this.isEditing = true,
      this.isNew = true})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final NotNegativeIntNumber value;
  @override
  @JsonKey()
  final MeasurementType type;
  @override
  @JsonKey()
  final MeasurementUnit unit;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool isEditing;
  @override
  @JsonKey()
  final bool isNew;

  @override
  String toString() {
    return 'MeasurementState(id: $id, value: $value, type: $type, unit: $unit, date: $date, isEditing: $isEditing, isNew: $isNew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasurementState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.isNew, isNew) || other.isNew == isNew));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, value, type, unit, date, isEditing, isNew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementStateCopyWith<_$_MeasurementState> get copyWith =>
      __$$_MeasurementStateCopyWithImpl<_$_MeasurementState>(this, _$identity);
}

abstract class _MeasurementState extends MeasurementState {
  const factory _MeasurementState(
      {final int id,
      final NotNegativeIntNumber value,
      final MeasurementType type,
      final MeasurementUnit unit,
      final DateTime? date,
      final bool isEditing,
      final bool isNew}) = _$_MeasurementState;
  const _MeasurementState._() : super._();

  @override
  int get id;
  @override
  NotNegativeIntNumber get value;
  @override
  MeasurementType get type;
  @override
  MeasurementUnit get unit;
  @override
  DateTime? get date;
  @override
  bool get isEditing;
  @override
  bool get isNew;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementStateCopyWith<_$_MeasurementState> get copyWith =>
      throw _privateConstructorUsedError;
}
