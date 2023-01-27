// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Consumption consumption) addConsumption,
    required TResult Function(Consumption consumption) deleteConsumption,
    required TResult Function() fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Consumption consumption)? addConsumption,
    TResult? Function(Consumption consumption)? deleteConsumption,
    TResult? Function()? fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Consumption consumption)? addConsumption,
    TResult Function(Consumption consumption)? deleteConsumption,
    TResult Function()? fetchAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_AddConsumption value) addConsumption,
    required TResult Function(_DeleteConsumption value) deleteConsumption,
    required TResult Function(_FetchAll value) fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_AddConsumption value)? addConsumption,
    TResult? Function(_DeleteConsumption value)? deleteConsumption,
    TResult? Function(_FetchAll value)? fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_AddConsumption value)? addConsumption,
    TResult Function(_DeleteConsumption value)? deleteConsumption,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WatchCopyWith<$Res> {
  factory _$$_WatchCopyWith(_$_Watch value, $Res Function(_$_Watch) then) =
      __$$_WatchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WatchCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_Watch>
    implements _$$_WatchCopyWith<$Res> {
  __$$_WatchCopyWithImpl(_$_Watch _value, $Res Function(_$_Watch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Watch implements _Watch {
  const _$_Watch();

  @override
  String toString() {
    return 'CalendarEvent.watch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Watch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Consumption consumption) addConsumption,
    required TResult Function(Consumption consumption) deleteConsumption,
    required TResult Function() fetchAll,
  }) {
    return watch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Consumption consumption)? addConsumption,
    TResult? Function(Consumption consumption)? deleteConsumption,
    TResult? Function()? fetchAll,
  }) {
    return watch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Consumption consumption)? addConsumption,
    TResult Function(Consumption consumption)? deleteConsumption,
    TResult Function()? fetchAll,
    required TResult orElse(),
  }) {
    if (watch != null) {
      return watch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_AddConsumption value) addConsumption,
    required TResult Function(_DeleteConsumption value) deleteConsumption,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return watch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_AddConsumption value)? addConsumption,
    TResult? Function(_DeleteConsumption value)? deleteConsumption,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return watch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_AddConsumption value)? addConsumption,
    TResult Function(_DeleteConsumption value)? deleteConsumption,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (watch != null) {
      return watch(this);
    }
    return orElse();
  }
}

abstract class _Watch implements CalendarEvent {
  const factory _Watch() = _$_Watch;
}

/// @nodoc
abstract class _$$_AddConsumptionCopyWith<$Res> {
  factory _$$_AddConsumptionCopyWith(
          _$_AddConsumption value, $Res Function(_$_AddConsumption) then) =
      __$$_AddConsumptionCopyWithImpl<$Res>;
  @useResult
  $Res call({Consumption consumption});

  $ConsumptionCopyWith<$Res> get consumption;
}

/// @nodoc
class __$$_AddConsumptionCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_AddConsumption>
    implements _$$_AddConsumptionCopyWith<$Res> {
  __$$_AddConsumptionCopyWithImpl(
      _$_AddConsumption _value, $Res Function(_$_AddConsumption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumption = null,
  }) {
    return _then(_$_AddConsumption(
      consumption: null == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as Consumption,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsumptionCopyWith<$Res> get consumption {
    return $ConsumptionCopyWith<$Res>(_value.consumption, (value) {
      return _then(_value.copyWith(consumption: value));
    });
  }
}

/// @nodoc

class _$_AddConsumption implements _AddConsumption {
  const _$_AddConsumption({required this.consumption});

  @override
  final Consumption consumption;

  @override
  String toString() {
    return 'CalendarEvent.addConsumption(consumption: $consumption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddConsumption &&
            (identical(other.consumption, consumption) ||
                other.consumption == consumption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consumption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddConsumptionCopyWith<_$_AddConsumption> get copyWith =>
      __$$_AddConsumptionCopyWithImpl<_$_AddConsumption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Consumption consumption) addConsumption,
    required TResult Function(Consumption consumption) deleteConsumption,
    required TResult Function() fetchAll,
  }) {
    return addConsumption(consumption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Consumption consumption)? addConsumption,
    TResult? Function(Consumption consumption)? deleteConsumption,
    TResult? Function()? fetchAll,
  }) {
    return addConsumption?.call(consumption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Consumption consumption)? addConsumption,
    TResult Function(Consumption consumption)? deleteConsumption,
    TResult Function()? fetchAll,
    required TResult orElse(),
  }) {
    if (addConsumption != null) {
      return addConsumption(consumption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_AddConsumption value) addConsumption,
    required TResult Function(_DeleteConsumption value) deleteConsumption,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return addConsumption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_AddConsumption value)? addConsumption,
    TResult? Function(_DeleteConsumption value)? deleteConsumption,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return addConsumption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_AddConsumption value)? addConsumption,
    TResult Function(_DeleteConsumption value)? deleteConsumption,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (addConsumption != null) {
      return addConsumption(this);
    }
    return orElse();
  }
}

abstract class _AddConsumption implements CalendarEvent {
  const factory _AddConsumption({required final Consumption consumption}) =
      _$_AddConsumption;

  Consumption get consumption;
  @JsonKey(ignore: true)
  _$$_AddConsumptionCopyWith<_$_AddConsumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteConsumptionCopyWith<$Res> {
  factory _$$_DeleteConsumptionCopyWith(_$_DeleteConsumption value,
          $Res Function(_$_DeleteConsumption) then) =
      __$$_DeleteConsumptionCopyWithImpl<$Res>;
  @useResult
  $Res call({Consumption consumption});

  $ConsumptionCopyWith<$Res> get consumption;
}

/// @nodoc
class __$$_DeleteConsumptionCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_DeleteConsumption>
    implements _$$_DeleteConsumptionCopyWith<$Res> {
  __$$_DeleteConsumptionCopyWithImpl(
      _$_DeleteConsumption _value, $Res Function(_$_DeleteConsumption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consumption = null,
  }) {
    return _then(_$_DeleteConsumption(
      consumption: null == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as Consumption,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsumptionCopyWith<$Res> get consumption {
    return $ConsumptionCopyWith<$Res>(_value.consumption, (value) {
      return _then(_value.copyWith(consumption: value));
    });
  }
}

/// @nodoc

class _$_DeleteConsumption implements _DeleteConsumption {
  const _$_DeleteConsumption({required this.consumption});

  @override
  final Consumption consumption;

  @override
  String toString() {
    return 'CalendarEvent.deleteConsumption(consumption: $consumption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteConsumption &&
            (identical(other.consumption, consumption) ||
                other.consumption == consumption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consumption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteConsumptionCopyWith<_$_DeleteConsumption> get copyWith =>
      __$$_DeleteConsumptionCopyWithImpl<_$_DeleteConsumption>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Consumption consumption) addConsumption,
    required TResult Function(Consumption consumption) deleteConsumption,
    required TResult Function() fetchAll,
  }) {
    return deleteConsumption(consumption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Consumption consumption)? addConsumption,
    TResult? Function(Consumption consumption)? deleteConsumption,
    TResult? Function()? fetchAll,
  }) {
    return deleteConsumption?.call(consumption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Consumption consumption)? addConsumption,
    TResult Function(Consumption consumption)? deleteConsumption,
    TResult Function()? fetchAll,
    required TResult orElse(),
  }) {
    if (deleteConsumption != null) {
      return deleteConsumption(consumption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_AddConsumption value) addConsumption,
    required TResult Function(_DeleteConsumption value) deleteConsumption,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return deleteConsumption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_AddConsumption value)? addConsumption,
    TResult? Function(_DeleteConsumption value)? deleteConsumption,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return deleteConsumption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_AddConsumption value)? addConsumption,
    TResult Function(_DeleteConsumption value)? deleteConsumption,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (deleteConsumption != null) {
      return deleteConsumption(this);
    }
    return orElse();
  }
}

abstract class _DeleteConsumption implements CalendarEvent {
  const factory _DeleteConsumption({required final Consumption consumption}) =
      _$_DeleteConsumption;

  Consumption get consumption;
  @JsonKey(ignore: true)
  _$$_DeleteConsumptionCopyWith<_$_DeleteConsumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAllCopyWith<$Res> {
  factory _$$_FetchAllCopyWith(
          _$_FetchAll value, $Res Function(_$_FetchAll) then) =
      __$$_FetchAllCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchAllCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_FetchAll>
    implements _$$_FetchAllCopyWith<$Res> {
  __$$_FetchAllCopyWithImpl(
      _$_FetchAll _value, $Res Function(_$_FetchAll) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchAll implements _FetchAll {
  const _$_FetchAll();

  @override
  String toString() {
    return 'CalendarEvent.fetchAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Consumption consumption) addConsumption,
    required TResult Function(Consumption consumption) deleteConsumption,
    required TResult Function() fetchAll,
  }) {
    return fetchAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Consumption consumption)? addConsumption,
    TResult? Function(Consumption consumption)? deleteConsumption,
    TResult? Function()? fetchAll,
  }) {
    return fetchAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Consumption consumption)? addConsumption,
    TResult Function(Consumption consumption)? deleteConsumption,
    TResult Function()? fetchAll,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_AddConsumption value) addConsumption,
    required TResult Function(_DeleteConsumption value) deleteConsumption,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return fetchAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_AddConsumption value)? addConsumption,
    TResult? Function(_DeleteConsumption value)? deleteConsumption,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return fetchAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_AddConsumption value)? addConsumption,
    TResult Function(_DeleteConsumption value)? deleteConsumption,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll(this);
    }
    return orElse();
  }
}

abstract class _FetchAll implements CalendarEvent {
  const factory _FetchAll() = _$_FetchAll;
}

/// @nodoc
mixin _$CalendarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)
        success,
    required TResult Function(CalendarFailure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult? Function(CalendarFailure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult Function(CalendarFailure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'CalendarState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)
        success,
    required TResult Function(CalendarFailure failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult? Function(CalendarFailure failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult Function(CalendarFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CalendarState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'CalendarState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)
        success,
    required TResult Function(CalendarFailure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult? Function(CalendarFailure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult Function(CalendarFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends CalendarState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
              List<Consumption>>
          events});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
  }) {
    return _then(_$_Success(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                  List<Consumption>>,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success({required this.events}) : super._();

  @override
  final Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
      List<Consumption>> events;

  @override
  String toString() {
    return 'CalendarState.success(events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.events, events) || other.events == events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, events);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)
        success,
    required TResult Function(CalendarFailure failure) failure,
  }) {
    return success(events);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult? Function(CalendarFailure failure)? failure,
  }) {
    return success?.call(events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult Function(CalendarFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends CalendarState {
  const factory _Success(
      {required final Tuple4<List<Medicine>, List<Appointment>,
              List<Measurement>, List<Consumption>>
          events}) = _$_Success;
  const _Success._() : super._();

  Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
      List<Consumption>> get events;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({CalendarFailure failure});

  $CalendarFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Failure(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CalendarFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarFailureCopyWith<$Res> get failure {
    return $CalendarFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure({required this.failure}) : super._();

  @override
  final CalendarFailure failure;

  @override
  String toString() {
    return 'CalendarState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)
        success,
    required TResult Function(CalendarFailure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult? Function(CalendarFailure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
                    List<Consumption>>
                events)?
        success,
    TResult Function(CalendarFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends CalendarState {
  const factory _Failure({required final CalendarFailure failure}) = _$_Failure;
  const _Failure._() : super._();

  CalendarFailure get failure;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
