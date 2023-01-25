// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'NotificationsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_ListenNotificationPrefencesCopyWith<$Res> {
  factory _$$_ListenNotificationPrefencesCopyWith(
          _$_ListenNotificationPrefences value,
          $Res Function(_$_ListenNotificationPrefences) then) =
      __$$_ListenNotificationPrefencesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ListenNotificationPrefencesCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$_ListenNotificationPrefences>
    implements _$$_ListenNotificationPrefencesCopyWith<$Res> {
  __$$_ListenNotificationPrefencesCopyWithImpl(
      _$_ListenNotificationPrefences _value,
      $Res Function(_$_ListenNotificationPrefences) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ListenNotificationPrefences implements _ListenNotificationPrefences {
  const _$_ListenNotificationPrefences();

  @override
  String toString() {
    return 'NotificationsEvent.listenNotificationPrefences()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListenNotificationPrefences);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) {
    return listenNotificationPrefences();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) {
    return listenNotificationPrefences?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (listenNotificationPrefences != null) {
      return listenNotificationPrefences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) {
    return listenNotificationPrefences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) {
    return listenNotificationPrefences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (listenNotificationPrefences != null) {
      return listenNotificationPrefences(this);
    }
    return orElse();
  }
}

abstract class _ListenNotificationPrefences implements NotificationsEvent {
  const factory _ListenNotificationPrefences() = _$_ListenNotificationPrefences;
}

/// @nodoc
abstract class _$$_AddNotificationPreferenceCopyWith<$Res> {
  factory _$$_AddNotificationPreferenceCopyWith(
          _$_AddNotificationPreference value,
          $Res Function(_$_AddNotificationPreference) then) =
      __$$_AddNotificationPreferenceCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationPreference notificationPreference});
}

/// @nodoc
class __$$_AddNotificationPreferenceCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$_AddNotificationPreference>
    implements _$$_AddNotificationPreferenceCopyWith<$Res> {
  __$$_AddNotificationPreferenceCopyWithImpl(
      _$_AddNotificationPreference _value,
      $Res Function(_$_AddNotificationPreference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPreference = null,
  }) {
    return _then(_$_AddNotificationPreference(
      null == notificationPreference
          ? _value.notificationPreference
          : notificationPreference // ignore: cast_nullable_to_non_nullable
              as NotificationPreference,
    ));
  }
}

/// @nodoc

class _$_AddNotificationPreference implements _AddNotificationPreference {
  const _$_AddNotificationPreference(this.notificationPreference);

  @override
  final NotificationPreference notificationPreference;

  @override
  String toString() {
    return 'NotificationsEvent.addNotificationPreference(notificationPreference: $notificationPreference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNotificationPreference &&
            (identical(other.notificationPreference, notificationPreference) ||
                other.notificationPreference == notificationPreference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationPreference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddNotificationPreferenceCopyWith<_$_AddNotificationPreference>
      get copyWith => __$$_AddNotificationPreferenceCopyWithImpl<
          _$_AddNotificationPreference>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) {
    return addNotificationPreference(notificationPreference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) {
    return addNotificationPreference?.call(notificationPreference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (addNotificationPreference != null) {
      return addNotificationPreference(notificationPreference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) {
    return addNotificationPreference(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) {
    return addNotificationPreference?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (addNotificationPreference != null) {
      return addNotificationPreference(this);
    }
    return orElse();
  }
}

abstract class _AddNotificationPreference implements NotificationsEvent {
  const factory _AddNotificationPreference(
          final NotificationPreference notificationPreference) =
      _$_AddNotificationPreference;

  NotificationPreference get notificationPreference;
  @JsonKey(ignore: true)
  _$$_AddNotificationPreferenceCopyWith<_$_AddNotificationPreference>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveNotificationPreferenceCopyWith<$Res> {
  factory _$$_RemoveNotificationPreferenceCopyWith(
          _$_RemoveNotificationPreference value,
          $Res Function(_$_RemoveNotificationPreference) then) =
      __$$_RemoveNotificationPreferenceCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationPreference notificationPreference});
}

/// @nodoc
class __$$_RemoveNotificationPreferenceCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$_RemoveNotificationPreference>
    implements _$$_RemoveNotificationPreferenceCopyWith<$Res> {
  __$$_RemoveNotificationPreferenceCopyWithImpl(
      _$_RemoveNotificationPreference _value,
      $Res Function(_$_RemoveNotificationPreference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPreference = null,
  }) {
    return _then(_$_RemoveNotificationPreference(
      null == notificationPreference
          ? _value.notificationPreference
          : notificationPreference // ignore: cast_nullable_to_non_nullable
              as NotificationPreference,
    ));
  }
}

/// @nodoc

class _$_RemoveNotificationPreference implements _RemoveNotificationPreference {
  const _$_RemoveNotificationPreference(this.notificationPreference);

  @override
  final NotificationPreference notificationPreference;

  @override
  String toString() {
    return 'NotificationsEvent.removeNotificationPreference(notificationPreference: $notificationPreference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveNotificationPreference &&
            (identical(other.notificationPreference, notificationPreference) ||
                other.notificationPreference == notificationPreference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationPreference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveNotificationPreferenceCopyWith<_$_RemoveNotificationPreference>
      get copyWith => __$$_RemoveNotificationPreferenceCopyWithImpl<
          _$_RemoveNotificationPreference>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) {
    return removeNotificationPreference(notificationPreference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) {
    return removeNotificationPreference?.call(notificationPreference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (removeNotificationPreference != null) {
      return removeNotificationPreference(notificationPreference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) {
    return removeNotificationPreference(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) {
    return removeNotificationPreference?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (removeNotificationPreference != null) {
      return removeNotificationPreference(this);
    }
    return orElse();
  }
}

abstract class _RemoveNotificationPreference implements NotificationsEvent {
  const factory _RemoveNotificationPreference(
          final NotificationPreference notificationPreference) =
      _$_RemoveNotificationPreference;

  NotificationPreference get notificationPreference;
  @JsonKey(ignore: true)
  _$$_RemoveNotificationPreferenceCopyWith<_$_RemoveNotificationPreference>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchNotificationPreferencesCopyWith<$Res> {
  factory _$$_FetchNotificationPreferencesCopyWith(
          _$_FetchNotificationPreferences value,
          $Res Function(_$_FetchNotificationPreferences) then) =
      __$$_FetchNotificationPreferencesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchNotificationPreferencesCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res,
        _$_FetchNotificationPreferences>
    implements _$$_FetchNotificationPreferencesCopyWith<$Res> {
  __$$_FetchNotificationPreferencesCopyWithImpl(
      _$_FetchNotificationPreferences _value,
      $Res Function(_$_FetchNotificationPreferences) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchNotificationPreferences implements _FetchNotificationPreferences {
  const _$_FetchNotificationPreferences();

  @override
  String toString() {
    return 'NotificationsEvent.fetchNotificationPreferences()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchNotificationPreferences);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() listenNotificationPrefences,
    required TResult Function(NotificationPreference notificationPreference)
        addNotificationPreference,
    required TResult Function(NotificationPreference notificationPreference)
        removeNotificationPreference,
    required TResult Function() fetchNotificationPreferences,
  }) {
    return fetchNotificationPreferences();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? listenNotificationPrefences,
    TResult? Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult? Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult? Function()? fetchNotificationPreferences,
  }) {
    return fetchNotificationPreferences?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? listenNotificationPrefences,
    TResult Function(NotificationPreference notificationPreference)?
        addNotificationPreference,
    TResult Function(NotificationPreference notificationPreference)?
        removeNotificationPreference,
    TResult Function()? fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (fetchNotificationPreferences != null) {
      return fetchNotificationPreferences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ListenNotificationPrefences value)
        listenNotificationPrefences,
    required TResult Function(_AddNotificationPreference value)
        addNotificationPreference,
    required TResult Function(_RemoveNotificationPreference value)
        removeNotificationPreference,
    required TResult Function(_FetchNotificationPreferences value)
        fetchNotificationPreferences,
  }) {
    return fetchNotificationPreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult? Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult? Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult? Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
  }) {
    return fetchNotificationPreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ListenNotificationPrefences value)?
        listenNotificationPrefences,
    TResult Function(_AddNotificationPreference value)?
        addNotificationPreference,
    TResult Function(_RemoveNotificationPreference value)?
        removeNotificationPreference,
    TResult Function(_FetchNotificationPreferences value)?
        fetchNotificationPreferences,
    required TResult orElse(),
  }) {
    if (fetchNotificationPreferences != null) {
      return fetchNotificationPreferences(this);
    }
    return orElse();
  }
}

abstract class _FetchNotificationPreferences implements NotificationsEvent {
  const factory _FetchNotificationPreferences() =
      _$_FetchNotificationPreferences;
}

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationPreference> notificationPreferences)
        loaded,
    required TResult Function(NotificationFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult? Function(NotificationFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult Function(NotificationFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'NotificationsState.initial()';
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
            List<NotificationPreference> notificationPreferences)
        loaded,
    required TResult Function(NotificationFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult? Function(NotificationFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult Function(NotificationFailure failure)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends NotificationsState {
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
    extends _$NotificationsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'NotificationsState.loading()';
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
            List<NotificationPreference> notificationPreferences)
        loaded,
    required TResult Function(NotificationFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult? Function(NotificationFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult Function(NotificationFailure failure)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends NotificationsState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationPreference> notificationPreferences});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPreferences = null,
  }) {
    return _then(_$_Loaded(
      null == notificationPreferences
          ? _value._notificationPreferences
          : notificationPreferences // ignore: cast_nullable_to_non_nullable
              as List<NotificationPreference>,
    ));
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(final List<NotificationPreference> notificationPreferences)
      : _notificationPreferences = notificationPreferences,
        super._();

  final List<NotificationPreference> _notificationPreferences;
  @override
  List<NotificationPreference> get notificationPreferences {
    if (_notificationPreferences is EqualUnmodifiableListView)
      return _notificationPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationPreferences);
  }

  @override
  String toString() {
    return 'NotificationsState.loaded(notificationPreferences: $notificationPreferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(
                other._notificationPreferences, _notificationPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_notificationPreferences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationPreference> notificationPreferences)
        loaded,
    required TResult Function(NotificationFailure failure) error,
  }) {
    return loaded(notificationPreferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult? Function(NotificationFailure failure)? error,
  }) {
    return loaded?.call(notificationPreferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult Function(NotificationFailure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notificationPreferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends NotificationsState {
  const factory _Loaded(
      final List<NotificationPreference> notificationPreferences) = _$_Loaded;
  const _Loaded._() : super._();

  List<NotificationPreference> get notificationPreferences;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationFailure failure});

  $NotificationFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Error(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as NotificationFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationFailureCopyWith<$Res> get failure {
    return $NotificationFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error(this.failure) : super._();

  @override
  final NotificationFailure failure;

  @override
  String toString() {
    return 'NotificationsState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<NotificationPreference> notificationPreferences)
        loaded,
    required TResult Function(NotificationFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult? Function(NotificationFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationPreference> notificationPreferences)?
        loaded,
    TResult Function(NotificationFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends NotificationsState {
  const factory _Error(final NotificationFailure failure) = _$_Error;
  const _Error._() : super._();

  NotificationFailure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
