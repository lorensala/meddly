// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Consumption {
  int get id => throw _privateConstructorUsedError;
  int get medicineId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get realConsumptionDate => throw _privateConstructorUsedError;
  bool get consumed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsumptionCopyWith<Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionCopyWith<$Res> {
  factory $ConsumptionCopyWith(
          Consumption value, $Res Function(Consumption) then) =
      _$ConsumptionCopyWithImpl<$Res, Consumption>;
  @useResult
  $Res call(
      {int id,
      int medicineId,
      DateTime date,
      DateTime realConsumptionDate,
      bool consumed});
}

/// @nodoc
class _$ConsumptionCopyWithImpl<$Res, $Val extends Consumption>
    implements $ConsumptionCopyWith<$Res> {
  _$ConsumptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineId = null,
    Object? date = null,
    Object? realConsumptionDate = null,
    Object? consumed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      realConsumptionDate: null == realConsumptionDate
          ? _value.realConsumptionDate
          : realConsumptionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsumptionCopyWith<$Res>
    implements $ConsumptionCopyWith<$Res> {
  factory _$$_ConsumptionCopyWith(
          _$_Consumption value, $Res Function(_$_Consumption) then) =
      __$$_ConsumptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int medicineId,
      DateTime date,
      DateTime realConsumptionDate,
      bool consumed});
}

/// @nodoc
class __$$_ConsumptionCopyWithImpl<$Res>
    extends _$ConsumptionCopyWithImpl<$Res, _$_Consumption>
    implements _$$_ConsumptionCopyWith<$Res> {
  __$$_ConsumptionCopyWithImpl(
      _$_Consumption _value, $Res Function(_$_Consumption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineId = null,
    Object? date = null,
    Object? realConsumptionDate = null,
    Object? consumed = null,
  }) {
    return _then(_$_Consumption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      realConsumptionDate: null == realConsumptionDate
          ? _value.realConsumptionDate
          : realConsumptionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Consumption extends _Consumption {
  const _$_Consumption(
      {required this.id,
      required this.medicineId,
      required this.date,
      required this.realConsumptionDate,
      required this.consumed})
      : super._();

  @override
  final int id;
  @override
  final int medicineId;
  @override
  final DateTime date;
  @override
  final DateTime realConsumptionDate;
  @override
  final bool consumed;

  @override
  String toString() {
    return 'Consumption(id: $id, medicineId: $medicineId, date: $date, realConsumptionDate: $realConsumptionDate, consumed: $consumed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Consumption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicineId, medicineId) ||
                other.medicineId == medicineId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.realConsumptionDate, realConsumptionDate) ||
                other.realConsumptionDate == realConsumptionDate) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, medicineId, date, realConsumptionDate, consumed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsumptionCopyWith<_$_Consumption> get copyWith =>
      __$$_ConsumptionCopyWithImpl<_$_Consumption>(this, _$identity);
}

abstract class _Consumption extends Consumption {
  const factory _Consumption(
      {required final int id,
      required final int medicineId,
      required final DateTime date,
      required final DateTime realConsumptionDate,
      required final bool consumed}) = _$_Consumption;
  const _Consumption._() : super._();

  @override
  int get id;
  @override
  int get medicineId;
  @override
  DateTime get date;
  @override
  DateTime get realConsumptionDate;
  @override
  bool get consumed;
  @override
  @JsonKey(ignore: true)
  _$$_ConsumptionCopyWith<_$_Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}
