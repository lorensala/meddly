// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Event {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String title, String description,
            DateTime date, bool consumed)
        fromConsumption,
    required TResult Function(
            int id, String title, String description, DateTime date)
        fromAppointment,
    required TResult Function(int id, String title, String description,
            DateTime date, bool measured)
        fromMeasurement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult? Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult? Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineEvent value) fromConsumption,
    required TResult Function(_AppointmentEvent value) fromAppointment,
    required TResult Function(_MeasurementEvent value) fromMeasurement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MedicineEvent value)? fromConsumption,
    TResult? Function(_AppointmentEvent value)? fromAppointment,
    TResult? Function(_MeasurementEvent value)? fromMeasurement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineEvent value)? fromConsumption,
    TResult Function(_AppointmentEvent value)? fromAppointment,
    TResult Function(_MeasurementEvent value)? fromMeasurement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call({int id, String title, String description, DateTime date});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicineEventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_MedicineEventCopyWith(
          _$_MedicineEvent value, $Res Function(_$_MedicineEvent) then) =
      __$$_MedicineEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String description, DateTime date, bool consumed});
}

/// @nodoc
class __$$_MedicineEventCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$_MedicineEvent>
    implements _$$_MedicineEventCopyWith<$Res> {
  __$$_MedicineEventCopyWithImpl(
      _$_MedicineEvent _value, $Res Function(_$_MedicineEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? consumed = null,
  }) {
    return _then(_$_MedicineEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MedicineEvent implements _MedicineEvent {
  const _$_MedicineEvent(
      {required this.id,
      this.title = '',
      this.description = '',
      required this.date,
      this.consumed = false});

  @override
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final bool consumed;

  @override
  String toString() {
    return 'Event.fromConsumption(id: $id, title: $title, description: $description, date: $date, consumed: $consumed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, date, consumed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicineEventCopyWith<_$_MedicineEvent> get copyWith =>
      __$$_MedicineEventCopyWithImpl<_$_MedicineEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String title, String description,
            DateTime date, bool consumed)
        fromConsumption,
    required TResult Function(
            int id, String title, String description, DateTime date)
        fromAppointment,
    required TResult Function(int id, String title, String description,
            DateTime date, bool measured)
        fromMeasurement,
  }) {
    return fromConsumption(id, title, description, date, consumed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult? Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult? Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
  }) {
    return fromConsumption?.call(id, title, description, date, consumed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromConsumption != null) {
      return fromConsumption(id, title, description, date, consumed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineEvent value) fromConsumption,
    required TResult Function(_AppointmentEvent value) fromAppointment,
    required TResult Function(_MeasurementEvent value) fromMeasurement,
  }) {
    return fromConsumption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MedicineEvent value)? fromConsumption,
    TResult? Function(_AppointmentEvent value)? fromAppointment,
    TResult? Function(_MeasurementEvent value)? fromMeasurement,
  }) {
    return fromConsumption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineEvent value)? fromConsumption,
    TResult Function(_AppointmentEvent value)? fromAppointment,
    TResult Function(_MeasurementEvent value)? fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromConsumption != null) {
      return fromConsumption(this);
    }
    return orElse();
  }
}

abstract class _MedicineEvent implements Event {
  const factory _MedicineEvent(
      {required final int id,
      final String title,
      final String description,
      required final DateTime date,
      final bool consumed}) = _$_MedicineEvent;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  bool get consumed;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineEventCopyWith<_$_MedicineEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppointmentEventCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory _$$_AppointmentEventCopyWith(
          _$_AppointmentEvent value, $Res Function(_$_AppointmentEvent) then) =
      __$$_AppointmentEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String description, DateTime date});
}

/// @nodoc
class __$$_AppointmentEventCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$_AppointmentEvent>
    implements _$$_AppointmentEventCopyWith<$Res> {
  __$$_AppointmentEventCopyWithImpl(
      _$_AppointmentEvent _value, $Res Function(_$_AppointmentEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_$_AppointmentEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_AppointmentEvent implements _AppointmentEvent {
  const _$_AppointmentEvent(
      {required this.id,
      this.title = '',
      this.description = '',
      required this.date});

  @override
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Event.fromAppointment(id: $id, title: $title, description: $description, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentEventCopyWith<_$_AppointmentEvent> get copyWith =>
      __$$_AppointmentEventCopyWithImpl<_$_AppointmentEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String title, String description,
            DateTime date, bool consumed)
        fromConsumption,
    required TResult Function(
            int id, String title, String description, DateTime date)
        fromAppointment,
    required TResult Function(int id, String title, String description,
            DateTime date, bool measured)
        fromMeasurement,
  }) {
    return fromAppointment(id, title, description, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult? Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult? Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
  }) {
    return fromAppointment?.call(id, title, description, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromAppointment != null) {
      return fromAppointment(id, title, description, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineEvent value) fromConsumption,
    required TResult Function(_AppointmentEvent value) fromAppointment,
    required TResult Function(_MeasurementEvent value) fromMeasurement,
  }) {
    return fromAppointment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MedicineEvent value)? fromConsumption,
    TResult? Function(_AppointmentEvent value)? fromAppointment,
    TResult? Function(_MeasurementEvent value)? fromMeasurement,
  }) {
    return fromAppointment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineEvent value)? fromConsumption,
    TResult Function(_AppointmentEvent value)? fromAppointment,
    TResult Function(_MeasurementEvent value)? fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromAppointment != null) {
      return fromAppointment(this);
    }
    return orElse();
  }
}

abstract class _AppointmentEvent implements Event {
  const factory _AppointmentEvent(
      {required final int id,
      final String title,
      final String description,
      required final DateTime date}) = _$_AppointmentEvent;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentEventCopyWith<_$_AppointmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MeasurementEventCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory _$$_MeasurementEventCopyWith(
          _$_MeasurementEvent value, $Res Function(_$_MeasurementEvent) then) =
      __$$_MeasurementEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String description, DateTime date, bool measured});
}

/// @nodoc
class __$$_MeasurementEventCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$_MeasurementEvent>
    implements _$$_MeasurementEventCopyWith<$Res> {
  __$$_MeasurementEventCopyWithImpl(
      _$_MeasurementEvent _value, $Res Function(_$_MeasurementEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? measured = null,
  }) {
    return _then(_$_MeasurementEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      measured: null == measured
          ? _value.measured
          : measured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MeasurementEvent implements _MeasurementEvent {
  const _$_MeasurementEvent(
      {required this.id,
      this.title = '',
      this.description = '',
      required this.date,
      this.measured = false});

  @override
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final bool measured;

  @override
  String toString() {
    return 'Event.fromMeasurement(id: $id, title: $title, description: $description, date: $date, measured: $measured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasurementEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.measured, measured) ||
                other.measured == measured));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, date, measured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementEventCopyWith<_$_MeasurementEvent> get copyWith =>
      __$$_MeasurementEventCopyWithImpl<_$_MeasurementEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String title, String description,
            DateTime date, bool consumed)
        fromConsumption,
    required TResult Function(
            int id, String title, String description, DateTime date)
        fromAppointment,
    required TResult Function(int id, String title, String description,
            DateTime date, bool measured)
        fromMeasurement,
  }) {
    return fromMeasurement(id, title, description, date, measured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult? Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult? Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
  }) {
    return fromMeasurement?.call(id, title, description, date, measured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String title, String description, DateTime date,
            bool consumed)?
        fromConsumption,
    TResult Function(int id, String title, String description, DateTime date)?
        fromAppointment,
    TResult Function(int id, String title, String description, DateTime date,
            bool measured)?
        fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromMeasurement != null) {
      return fromMeasurement(id, title, description, date, measured);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineEvent value) fromConsumption,
    required TResult Function(_AppointmentEvent value) fromAppointment,
    required TResult Function(_MeasurementEvent value) fromMeasurement,
  }) {
    return fromMeasurement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MedicineEvent value)? fromConsumption,
    TResult? Function(_AppointmentEvent value)? fromAppointment,
    TResult? Function(_MeasurementEvent value)? fromMeasurement,
  }) {
    return fromMeasurement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineEvent value)? fromConsumption,
    TResult Function(_AppointmentEvent value)? fromAppointment,
    TResult Function(_MeasurementEvent value)? fromMeasurement,
    required TResult orElse(),
  }) {
    if (fromMeasurement != null) {
      return fromMeasurement(this);
    }
    return orElse();
  }
}

abstract class _MeasurementEvent implements Event {
  const factory _MeasurementEvent(
      {required final int id,
      final String title,
      final String description,
      required final DateTime date,
      final bool measured}) = _$_MeasurementEvent;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  bool get measured;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementEventCopyWith<_$_MeasurementEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
