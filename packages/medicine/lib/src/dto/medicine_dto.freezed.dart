// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medicine_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicineDto _$MedicineDtoFromJson(Map<String, dynamic> json) {
  return _MedicineDto.fromJson(json);
}

/// @nodoc
mixin _$MedicineDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  int? get stockWarning => throw _privateConstructorUsedError;
  String get presentation => throw _privateConstructorUsedError;
  String get dosisUnit => throw _privateConstructorUsedError;
  double get dosis => throw _privateConstructorUsedError;
  int? get interval => throw _privateConstructorUsedError;
  List<int>? get days => throw _privateConstructorUsedError;
  List<String>? get hours => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicineDtoCopyWith<MedicineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineDtoCopyWith<$Res> {
  factory $MedicineDtoCopyWith(
          MedicineDto value, $Res Function(MedicineDto) then) =
      _$MedicineDtoCopyWithImpl<$Res, MedicineDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      DateTime startDate,
      DateTime? endDate,
      int? stock,
      int? stockWarning,
      String presentation,
      String dosisUnit,
      double dosis,
      int? interval,
      List<int>? days,
      List<String>? hours,
      String? instructions});
}

/// @nodoc
class _$MedicineDtoCopyWithImpl<$Res, $Val extends MedicineDto>
    implements $MedicineDtoCopyWith<$Res> {
  _$MedicineDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? stock = freezed,
    Object? stockWarning = freezed,
    Object? presentation = null,
    Object? dosisUnit = null,
    Object? dosis = null,
    Object? interval = freezed,
    Object? days = freezed,
    Object? hours = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      stockWarning: freezed == stockWarning
          ? _value.stockWarning
          : stockWarning // ignore: cast_nullable_to_non_nullable
              as int?,
      presentation: null == presentation
          ? _value.presentation
          : presentation // ignore: cast_nullable_to_non_nullable
              as String,
      dosisUnit: null == dosisUnit
          ? _value.dosisUnit
          : dosisUnit // ignore: cast_nullable_to_non_nullable
              as String,
      dosis: null == dosis
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as double,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicineDtoCopyWith<$Res>
    implements $MedicineDtoCopyWith<$Res> {
  factory _$$_MedicineDtoCopyWith(
          _$_MedicineDto value, $Res Function(_$_MedicineDto) then) =
      __$$_MedicineDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      DateTime startDate,
      DateTime? endDate,
      int? stock,
      int? stockWarning,
      String presentation,
      String dosisUnit,
      double dosis,
      int? interval,
      List<int>? days,
      List<String>? hours,
      String? instructions});
}

/// @nodoc
class __$$_MedicineDtoCopyWithImpl<$Res>
    extends _$MedicineDtoCopyWithImpl<$Res, _$_MedicineDto>
    implements _$$_MedicineDtoCopyWith<$Res> {
  __$$_MedicineDtoCopyWithImpl(
      _$_MedicineDto _value, $Res Function(_$_MedicineDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? stock = freezed,
    Object? stockWarning = freezed,
    Object? presentation = null,
    Object? dosisUnit = null,
    Object? dosis = null,
    Object? interval = freezed,
    Object? days = freezed,
    Object? hours = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_$_MedicineDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      stockWarning: freezed == stockWarning
          ? _value.stockWarning
          : stockWarning // ignore: cast_nullable_to_non_nullable
              as int?,
      presentation: null == presentation
          ? _value.presentation
          : presentation // ignore: cast_nullable_to_non_nullable
              as String,
      dosisUnit: null == dosisUnit
          ? _value.dosisUnit
          : dosisUnit // ignore: cast_nullable_to_non_nullable
              as String,
      dosis: null == dosis
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as double,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int?,
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      hours: freezed == hours
          ? _value._hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineDto extends _MedicineDto {
  const _$_MedicineDto(
      {required this.id,
      required this.name,
      required this.startDate,
      this.endDate,
      this.stock,
      this.stockWarning,
      required this.presentation,
      required this.dosisUnit,
      required this.dosis,
      this.interval,
      final List<int>? days,
      final List<String>? hours,
      this.instructions})
      : _days = days,
        _hours = hours,
        super._();

  factory _$_MedicineDto.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final int? stock;
  @override
  final int? stockWarning;
  @override
  final String presentation;
  @override
  final String dosisUnit;
  @override
  final double dosis;
  @override
  final int? interval;
  final List<int>? _days;
  @override
  List<int>? get days {
    final value = _days;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _hours;
  @override
  List<String>? get hours {
    final value = _hours;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? instructions;

  @override
  String toString() {
    return 'MedicineDto(id: $id, name: $name, startDate: $startDate, endDate: $endDate, stock: $stock, stockWarning: $stockWarning, presentation: $presentation, dosisUnit: $dosisUnit, dosis: $dosis, interval: $interval, days: $days, hours: $hours, instructions: $instructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.stockWarning, stockWarning) ||
                other.stockWarning == stockWarning) &&
            (identical(other.presentation, presentation) ||
                other.presentation == presentation) &&
            (identical(other.dosisUnit, dosisUnit) ||
                other.dosisUnit == dosisUnit) &&
            (identical(other.dosis, dosis) || other.dosis == dosis) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality().equals(other._hours, _hours) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      startDate,
      endDate,
      stock,
      stockWarning,
      presentation,
      dosisUnit,
      dosis,
      interval,
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(_hours),
      instructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicineDtoCopyWith<_$_MedicineDto> get copyWith =>
      __$$_MedicineDtoCopyWithImpl<_$_MedicineDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicineDtoToJson(
      this,
    );
  }
}

abstract class _MedicineDto extends MedicineDto {
  const factory _MedicineDto(
      {required final int id,
      required final String name,
      required final DateTime startDate,
      final DateTime? endDate,
      final int? stock,
      final int? stockWarning,
      required final String presentation,
      required final String dosisUnit,
      required final double dosis,
      final int? interval,
      final List<int>? days,
      final List<String>? hours,
      final String? instructions}) = _$_MedicineDto;
  const _MedicineDto._() : super._();

  factory _MedicineDto.fromJson(Map<String, dynamic> json) =
      _$_MedicineDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  int? get stock;
  @override
  int? get stockWarning;
  @override
  String get presentation;
  @override
  String get dosisUnit;
  @override
  double get dosis;
  @override
  int? get interval;
  @override
  List<int>? get days;
  @override
  List<String>? get hours;
  @override
  String? get instructions;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineDtoCopyWith<_$_MedicineDto> get copyWith =>
      throw _privateConstructorUsedError;
}
