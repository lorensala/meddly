// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeasurementDto _$MeasurementDtoFromJson(Map<String, dynamic> json) {
  return _MeasurementDto.fromJson(json);
}

/// @nodoc
mixin _$MeasurementDto {
  @HiveField(0)
  String get date => throw _privateConstructorUsedError;
  @HiveField(1)
  String get type => throw _privateConstructorUsedError;
  @HiveField(2)
  double get value => throw _privateConstructorUsedError;
  @HiveField(3)
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementDtoCopyWith<MeasurementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementDtoCopyWith<$Res> {
  factory $MeasurementDtoCopyWith(
          MeasurementDto value, $Res Function(MeasurementDto) then) =
      _$MeasurementDtoCopyWithImpl<$Res, MeasurementDto>;
  @useResult
  $Res call(
      {@HiveField(0) String date,
      @HiveField(1) String type,
      @HiveField(2) double value,
      @HiveField(3) int id});
}

/// @nodoc
class _$MeasurementDtoCopyWithImpl<$Res, $Val extends MeasurementDto>
    implements $MeasurementDtoCopyWith<$Res> {
  _$MeasurementDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? value = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementDtoCopyWith<$Res>
    implements $MeasurementDtoCopyWith<$Res> {
  factory _$$_MeasurementDtoCopyWith(
          _$_MeasurementDto value, $Res Function(_$_MeasurementDto) then) =
      __$$_MeasurementDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String date,
      @HiveField(1) String type,
      @HiveField(2) double value,
      @HiveField(3) int id});
}

/// @nodoc
class __$$_MeasurementDtoCopyWithImpl<$Res>
    extends _$MeasurementDtoCopyWithImpl<$Res, _$_MeasurementDto>
    implements _$$_MeasurementDtoCopyWith<$Res> {
  __$$_MeasurementDtoCopyWithImpl(
      _$_MeasurementDto _value, $Res Function(_$_MeasurementDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? value = null,
    Object? id = null,
  }) {
    return _then(_$_MeasurementDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasurementDto extends _MeasurementDto {
  const _$_MeasurementDto(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.type,
      @HiveField(2) required this.value,
      @HiveField(3) required this.id})
      : super._();

  factory _$_MeasurementDto.fromJson(Map<String, dynamic> json) =>
      _$$_MeasurementDtoFromJson(json);

  @override
  @HiveField(0)
  final String date;
  @override
  @HiveField(1)
  final String type;
  @override
  @HiveField(2)
  final double value;
  @override
  @HiveField(3)
  final int id;

  @override
  String toString() {
    return 'MeasurementDto(date: $date, type: $type, value: $value, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasurementDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, type, value, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementDtoCopyWith<_$_MeasurementDto> get copyWith =>
      __$$_MeasurementDtoCopyWithImpl<_$_MeasurementDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasurementDtoToJson(
      this,
    );
  }
}

abstract class _MeasurementDto extends MeasurementDto {
  const factory _MeasurementDto(
      {@HiveField(0) required final String date,
      @HiveField(1) required final String type,
      @HiveField(2) required final double value,
      @HiveField(3) required final int id}) = _$_MeasurementDto;
  const _MeasurementDto._() : super._();

  factory _MeasurementDto.fromJson(Map<String, dynamic> json) =
      _$_MeasurementDto.fromJson;

  @override
  @HiveField(0)
  String get date;
  @override
  @HiveField(1)
  String get type;
  @override
  @HiveField(2)
  double get value;
  @override
  @HiveField(3)
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementDtoCopyWith<_$_MeasurementDto> get copyWith =>
      throw _privateConstructorUsedError;
}
