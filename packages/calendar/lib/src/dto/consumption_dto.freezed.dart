// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsumptionDto _$ConsumptionDtoFromJson(Map<String, dynamic> json) {
  return _ConsumptionDto.fromJson(json);
}

/// @nodoc
mixin _$ConsumptionDto {
  @HiveField(0)
  String get date => throw _privateConstructorUsedError;
  @HiveField(1)
  String get realConsumptionDate => throw _privateConstructorUsedError;
  @HiveField(2)
  int get medicineId => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get consumed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumptionDtoCopyWith<ConsumptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionDtoCopyWith<$Res> {
  factory $ConsumptionDtoCopyWith(
          ConsumptionDto value, $Res Function(ConsumptionDto) then) =
      _$ConsumptionDtoCopyWithImpl<$Res, ConsumptionDto>;
  @useResult
  $Res call(
      {@HiveField(0) String date,
      @HiveField(1) String realConsumptionDate,
      @HiveField(2) int medicineId,
      @HiveField(3) bool consumed});
}

/// @nodoc
class _$ConsumptionDtoCopyWithImpl<$Res, $Val extends ConsumptionDto>
    implements $ConsumptionDtoCopyWith<$Res> {
  _$ConsumptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? realConsumptionDate = null,
    Object? medicineId = null,
    Object? consumed = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      realConsumptionDate: null == realConsumptionDate
          ? _value.realConsumptionDate
          : realConsumptionDate // ignore: cast_nullable_to_non_nullable
              as String,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as int,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsumptionDtoCopyWith<$Res>
    implements $ConsumptionDtoCopyWith<$Res> {
  factory _$$_ConsumptionDtoCopyWith(
          _$_ConsumptionDto value, $Res Function(_$_ConsumptionDto) then) =
      __$$_ConsumptionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String date,
      @HiveField(1) String realConsumptionDate,
      @HiveField(2) int medicineId,
      @HiveField(3) bool consumed});
}

/// @nodoc
class __$$_ConsumptionDtoCopyWithImpl<$Res>
    extends _$ConsumptionDtoCopyWithImpl<$Res, _$_ConsumptionDto>
    implements _$$_ConsumptionDtoCopyWith<$Res> {
  __$$_ConsumptionDtoCopyWithImpl(
      _$_ConsumptionDto _value, $Res Function(_$_ConsumptionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? realConsumptionDate = null,
    Object? medicineId = null,
    Object? consumed = null,
  }) {
    return _then(_$_ConsumptionDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      realConsumptionDate: null == realConsumptionDate
          ? _value.realConsumptionDate
          : realConsumptionDate // ignore: cast_nullable_to_non_nullable
              as String,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as int,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConsumptionDto extends _ConsumptionDto {
  const _$_ConsumptionDto(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.realConsumptionDate,
      @HiveField(2) required this.medicineId,
      @HiveField(3) required this.consumed})
      : super._();

  factory _$_ConsumptionDto.fromJson(Map<String, dynamic> json) =>
      _$$_ConsumptionDtoFromJson(json);

  @override
  @HiveField(0)
  final String date;
  @override
  @HiveField(1)
  final String realConsumptionDate;
  @override
  @HiveField(2)
  final int medicineId;
  @override
  @HiveField(3)
  final bool consumed;

  @override
  String toString() {
    return 'ConsumptionDto(date: $date, realConsumptionDate: $realConsumptionDate, medicineId: $medicineId, consumed: $consumed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsumptionDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.realConsumptionDate, realConsumptionDate) ||
                other.realConsumptionDate == realConsumptionDate) &&
            (identical(other.medicineId, medicineId) ||
                other.medicineId == medicineId) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, realConsumptionDate, medicineId, consumed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsumptionDtoCopyWith<_$_ConsumptionDto> get copyWith =>
      __$$_ConsumptionDtoCopyWithImpl<_$_ConsumptionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsumptionDtoToJson(
      this,
    );
  }
}

abstract class _ConsumptionDto extends ConsumptionDto {
  const factory _ConsumptionDto(
      {@HiveField(0) required final String date,
      @HiveField(1) required final String realConsumptionDate,
      @HiveField(2) required final int medicineId,
      @HiveField(3) required final bool consumed}) = _$_ConsumptionDto;
  const _ConsumptionDto._() : super._();

  factory _ConsumptionDto.fromJson(Map<String, dynamic> json) =
      _$_ConsumptionDto.fromJson;

  @override
  @HiveField(0)
  String get date;
  @override
  @HiveField(1)
  String get realConsumptionDate;
  @override
  @HiveField(2)
  int get medicineId;
  @override
  @HiveField(3)
  bool get consumed;
  @override
  @JsonKey(ignore: true)
  _$$_ConsumptionDtoCopyWith<_$_ConsumptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}
