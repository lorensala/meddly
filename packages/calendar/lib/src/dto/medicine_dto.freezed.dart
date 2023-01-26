// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get startDate => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get endDate => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get stock => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get stockWarning => throw _privateConstructorUsedError;
  @HiveField(5)
  String get presentation => throw _privateConstructorUsedError;
  @HiveField(6)
  String get dosisUnit => throw _privateConstructorUsedError;
  @HiveField(7)
  double get dosis => throw _privateConstructorUsedError;
  @HiveField(8)
  int? get interval => throw _privateConstructorUsedError;
  @HiveField(9)
  List<int>? get days => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String>? get hours => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get instructions => throw _privateConstructorUsedError;
  @HiveField(12)
  int get id => throw _privateConstructorUsedError;

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
      {@HiveField(0) String name,
      @HiveField(1) String startDate,
      @HiveField(2) String? endDate,
      @HiveField(3) int? stock,
      @HiveField(4) int? stockWarning,
      @HiveField(5) String presentation,
      @HiveField(6) String dosisUnit,
      @HiveField(7) double dosis,
      @HiveField(8) int? interval,
      @HiveField(9) List<int>? days,
      @HiveField(10) List<String>? hours,
      @HiveField(11) String? instructions,
      @HiveField(12) int id});
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
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@HiveField(0) String name,
      @HiveField(1) String startDate,
      @HiveField(2) String? endDate,
      @HiveField(3) int? stock,
      @HiveField(4) int? stockWarning,
      @HiveField(5) String presentation,
      @HiveField(6) String dosisUnit,
      @HiveField(7) double dosis,
      @HiveField(8) int? interval,
      @HiveField(9) List<int>? days,
      @HiveField(10) List<String>? hours,
      @HiveField(11) String? instructions,
      @HiveField(12) int id});
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
    Object? id = null,
  }) {
    return _then(_$_MedicineDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineDto extends _MedicineDto {
  const _$_MedicineDto(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.startDate,
      @HiveField(2) this.endDate,
      @HiveField(3) this.stock,
      @HiveField(4) this.stockWarning,
      @HiveField(5) required this.presentation,
      @HiveField(6) required this.dosisUnit,
      @HiveField(7) required this.dosis,
      @HiveField(8) this.interval,
      @HiveField(9) final List<int>? days,
      @HiveField(10) final List<String>? hours,
      @HiveField(11) this.instructions,
      @HiveField(12) required this.id})
      : _days = days,
        _hours = hours,
        super._();

  factory _$_MedicineDto.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineDtoFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String startDate;
  @override
  @HiveField(2)
  final String? endDate;
  @override
  @HiveField(3)
  final int? stock;
  @override
  @HiveField(4)
  final int? stockWarning;
  @override
  @HiveField(5)
  final String presentation;
  @override
  @HiveField(6)
  final String dosisUnit;
  @override
  @HiveField(7)
  final double dosis;
  @override
  @HiveField(8)
  final int? interval;
  final List<int>? _days;
  @override
  @HiveField(9)
  List<int>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _hours;
  @override
  @HiveField(10)
  List<String>? get hours {
    final value = _hours;
    if (value == null) return null;
    if (_hours is EqualUnmodifiableListView) return _hours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(11)
  final String? instructions;
  @override
  @HiveField(12)
  final int id;

  @override
  String toString() {
    return 'MedicineDto(name: $name, startDate: $startDate, endDate: $endDate, stock: $stock, stockWarning: $stockWarning, presentation: $presentation, dosisUnit: $dosisUnit, dosis: $dosis, interval: $interval, days: $days, hours: $hours, instructions: $instructions, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineDto &&
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
                other.instructions == instructions) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      instructions,
      id);

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
      {@HiveField(0) required final String name,
      @HiveField(1) required final String startDate,
      @HiveField(2) final String? endDate,
      @HiveField(3) final int? stock,
      @HiveField(4) final int? stockWarning,
      @HiveField(5) required final String presentation,
      @HiveField(6) required final String dosisUnit,
      @HiveField(7) required final double dosis,
      @HiveField(8) final int? interval,
      @HiveField(9) final List<int>? days,
      @HiveField(10) final List<String>? hours,
      @HiveField(11) final String? instructions,
      @HiveField(12) required final int id}) = _$_MedicineDto;
  const _MedicineDto._() : super._();

  factory _MedicineDto.fromJson(Map<String, dynamic> json) =
      _$_MedicineDto.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get startDate;
  @override
  @HiveField(2)
  String? get endDate;
  @override
  @HiveField(3)
  int? get stock;
  @override
  @HiveField(4)
  int? get stockWarning;
  @override
  @HiveField(5)
  String get presentation;
  @override
  @HiveField(6)
  String get dosisUnit;
  @override
  @HiveField(7)
  double get dosis;
  @override
  @HiveField(8)
  int? get interval;
  @override
  @HiveField(9)
  List<int>? get days;
  @override
  @HiveField(10)
  List<String>? get hours;
  @override
  @HiveField(11)
  String? get instructions;
  @override
  @HiveField(12)
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineDtoCopyWith<_$_MedicineDto> get copyWith =>
      throw _privateConstructorUsedError;
}
