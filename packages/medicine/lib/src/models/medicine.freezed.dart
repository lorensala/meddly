// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Medicine _$MedicineFromJson(Map<String, dynamic> json) {
  return _Medicine.fromJson(json);
}

/// @nodoc
mixin _$Medicine {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get startDate => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get endDate => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get stock => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get stockWarning => throw _privateConstructorUsedError;
  @HiveField(6)
  MedicinePresentation get presentation => throw _privateConstructorUsedError;
  @HiveField(7)
  MedicineDosisUnit get dosisUnit => throw _privateConstructorUsedError;
  @HiveField(8)
  double get dosis => throw _privateConstructorUsedError;
  @HiveField(9)
  int? get interval => throw _privateConstructorUsedError;
  @HiveField(10)
  @ListMedicineDayOrNullConverter()
  List<MedicineDay>? get days => throw _privateConstructorUsedError;
  @HiveField(11)
  @ListTimeOfDayOrNullConverter()
  List<TimeOfDay>? get hours => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicineCopyWith<Medicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineCopyWith<$Res> {
  factory $MedicineCopyWith(Medicine value, $Res Function(Medicine) then) =
      _$MedicineCopyWithImpl<$Res, Medicine>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) DateTime startDate,
      @HiveField(3) DateTime? endDate,
      @HiveField(4) int? stock,
      @HiveField(5) int? stockWarning,
      @HiveField(6) MedicinePresentation presentation,
      @HiveField(7) MedicineDosisUnit dosisUnit,
      @HiveField(8) double dosis,
      @HiveField(9) int? interval,
      @HiveField(10) @ListMedicineDayOrNullConverter() List<MedicineDay>? days,
      @HiveField(11) @ListTimeOfDayOrNullConverter() List<TimeOfDay>? hours,
      @HiveField(12) String? instructions});
}

/// @nodoc
class _$MedicineCopyWithImpl<$Res, $Val extends Medicine>
    implements $MedicineCopyWith<$Res> {
  _$MedicineCopyWithImpl(this._value, this._then);

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
              as MedicinePresentation,
      dosisUnit: null == dosisUnit
          ? _value.dosisUnit
          : dosisUnit // ignore: cast_nullable_to_non_nullable
              as MedicineDosisUnit,
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
              as List<MedicineDay>?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicineCopyWith<$Res> implements $MedicineCopyWith<$Res> {
  factory _$$_MedicineCopyWith(
          _$_Medicine value, $Res Function(_$_Medicine) then) =
      __$$_MedicineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) DateTime startDate,
      @HiveField(3) DateTime? endDate,
      @HiveField(4) int? stock,
      @HiveField(5) int? stockWarning,
      @HiveField(6) MedicinePresentation presentation,
      @HiveField(7) MedicineDosisUnit dosisUnit,
      @HiveField(8) double dosis,
      @HiveField(9) int? interval,
      @HiveField(10) @ListMedicineDayOrNullConverter() List<MedicineDay>? days,
      @HiveField(11) @ListTimeOfDayOrNullConverter() List<TimeOfDay>? hours,
      @HiveField(12) String? instructions});
}

/// @nodoc
class __$$_MedicineCopyWithImpl<$Res>
    extends _$MedicineCopyWithImpl<$Res, _$_Medicine>
    implements _$$_MedicineCopyWith<$Res> {
  __$$_MedicineCopyWithImpl(
      _$_Medicine _value, $Res Function(_$_Medicine) _then)
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
    return _then(_$_Medicine(
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
              as MedicinePresentation,
      dosisUnit: null == dosisUnit
          ? _value.dosisUnit
          : dosisUnit // ignore: cast_nullable_to_non_nullable
              as MedicineDosisUnit,
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
              as List<MedicineDay>?,
      hours: freezed == hours
          ? _value._hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Medicine implements _Medicine {
  const _$_Medicine(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.name,
      @HiveField(2)
          required this.startDate,
      @HiveField(3)
          this.endDate,
      @HiveField(4)
          this.stock,
      @HiveField(5)
          this.stockWarning,
      @HiveField(6)
          required this.presentation,
      @HiveField(7)
          required this.dosisUnit,
      @HiveField(8)
          required this.dosis,
      @HiveField(9)
          this.interval,
      @HiveField(10)
      @ListMedicineDayOrNullConverter()
          final List<MedicineDay>? days,
      @HiveField(11)
      @ListTimeOfDayOrNullConverter()
          final List<TimeOfDay>? hours,
      @HiveField(12)
          this.instructions})
      : _days = days,
        _hours = hours;

  factory _$_Medicine.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final DateTime startDate;
  @override
  @HiveField(3)
  final DateTime? endDate;
  @override
  @HiveField(4)
  final int? stock;
  @override
  @HiveField(5)
  final int? stockWarning;
  @override
  @HiveField(6)
  final MedicinePresentation presentation;
  @override
  @HiveField(7)
  final MedicineDosisUnit dosisUnit;
  @override
  @HiveField(8)
  final double dosis;
  @override
  @HiveField(9)
  final int? interval;
  final List<MedicineDay>? _days;
  @override
  @HiveField(10)
  @ListMedicineDayOrNullConverter()
  List<MedicineDay>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TimeOfDay>? _hours;
  @override
  @HiveField(11)
  @ListTimeOfDayOrNullConverter()
  List<TimeOfDay>? get hours {
    final value = _hours;
    if (value == null) return null;
    if (_hours is EqualUnmodifiableListView) return _hours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(12)
  final String? instructions;

  @override
  String toString() {
    return 'Medicine(id: $id, name: $name, startDate: $startDate, endDate: $endDate, stock: $stock, stockWarning: $stockWarning, presentation: $presentation, dosisUnit: $dosisUnit, dosis: $dosis, interval: $interval, days: $days, hours: $hours, instructions: $instructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Medicine &&
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
  _$$_MedicineCopyWith<_$_Medicine> get copyWith =>
      __$$_MedicineCopyWithImpl<_$_Medicine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicineToJson(
      this,
    );
  }
}

abstract class _Medicine implements Medicine {
  const factory _Medicine(
      {@HiveField(0)
          required final int id,
      @HiveField(1)
          required final String name,
      @HiveField(2)
          required final DateTime startDate,
      @HiveField(3)
          final DateTime? endDate,
      @HiveField(4)
          final int? stock,
      @HiveField(5)
          final int? stockWarning,
      @HiveField(6)
          required final MedicinePresentation presentation,
      @HiveField(7)
          required final MedicineDosisUnit dosisUnit,
      @HiveField(8)
          required final double dosis,
      @HiveField(9)
          final int? interval,
      @HiveField(10)
      @ListMedicineDayOrNullConverter()
          final List<MedicineDay>? days,
      @HiveField(11)
      @ListTimeOfDayOrNullConverter()
          final List<TimeOfDay>? hours,
      @HiveField(12)
          final String? instructions}) = _$_Medicine;

  factory _Medicine.fromJson(Map<String, dynamic> json) = _$_Medicine.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  DateTime get startDate;
  @override
  @HiveField(3)
  DateTime? get endDate;
  @override
  @HiveField(4)
  int? get stock;
  @override
  @HiveField(5)
  int? get stockWarning;
  @override
  @HiveField(6)
  MedicinePresentation get presentation;
  @override
  @HiveField(7)
  MedicineDosisUnit get dosisUnit;
  @override
  @HiveField(8)
  double get dosis;
  @override
  @HiveField(9)
  int? get interval;
  @override
  @HiveField(10)
  @ListMedicineDayOrNullConverter()
  List<MedicineDay>? get days;
  @override
  @HiveField(11)
  @ListTimeOfDayOrNullConverter()
  List<TimeOfDay>? get hours;
  @override
  @HiveField(12)
  String? get instructions;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineCopyWith<_$_Medicine> get copyWith =>
      throw _privateConstructorUsedError;
}
