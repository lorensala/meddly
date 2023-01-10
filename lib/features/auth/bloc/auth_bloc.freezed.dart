// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequestedEvent,
    required TResult Function(Option<User> user) userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequestedEvent,
    TResult? Function(Option<User> user)? userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequestedEvent,
    TResult Function(Option<User> user)? userChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutRequestedEvent value) logoutRequestedEvent,
    required TResult Function(FirebaseUserChanged value) userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult? Function(FirebaseUserChanged value)? userChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult Function(FirebaseUserChanged value)? userChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutRequestedEventCopyWith<$Res> {
  factory _$$LogoutRequestedEventCopyWith(_$LogoutRequestedEvent value,
          $Res Function(_$LogoutRequestedEvent) then) =
      __$$LogoutRequestedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutRequestedEvent>
    implements _$$LogoutRequestedEventCopyWith<$Res> {
  __$$LogoutRequestedEventCopyWithImpl(_$LogoutRequestedEvent _value,
      $Res Function(_$LogoutRequestedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutRequestedEvent implements LogoutRequestedEvent {
  const _$LogoutRequestedEvent();

  @override
  String toString() {
    return 'AuthEvent.logoutRequestedEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequestedEvent,
    required TResult Function(Option<User> user) userChanged,
  }) {
    return logoutRequestedEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequestedEvent,
    TResult? Function(Option<User> user)? userChanged,
  }) {
    return logoutRequestedEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequestedEvent,
    TResult Function(Option<User> user)? userChanged,
    required TResult orElse(),
  }) {
    if (logoutRequestedEvent != null) {
      return logoutRequestedEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutRequestedEvent value) logoutRequestedEvent,
    required TResult Function(FirebaseUserChanged value) userChanged,
  }) {
    return logoutRequestedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult? Function(FirebaseUserChanged value)? userChanged,
  }) {
    return logoutRequestedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult Function(FirebaseUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (logoutRequestedEvent != null) {
      return logoutRequestedEvent(this);
    }
    return orElse();
  }
}

abstract class LogoutRequestedEvent implements AuthEvent {
  const factory LogoutRequestedEvent() = _$LogoutRequestedEvent;
}

/// @nodoc
abstract class _$$FirebaseUserChangedCopyWith<$Res> {
  factory _$$FirebaseUserChangedCopyWith(_$FirebaseUserChanged value,
          $Res Function(_$FirebaseUserChanged) then) =
      __$$FirebaseUserChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Option<User> user});
}

/// @nodoc
class __$$FirebaseUserChangedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FirebaseUserChanged>
    implements _$$FirebaseUserChangedCopyWith<$Res> {
  __$$FirebaseUserChangedCopyWithImpl(
      _$FirebaseUserChanged _value, $Res Function(_$FirebaseUserChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$FirebaseUserChanged(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Option<User>,
    ));
  }
}

/// @nodoc

class _$FirebaseUserChanged implements FirebaseUserChanged {
  const _$FirebaseUserChanged(this.user);

  @override
  final Option<User> user;

  @override
  String toString() {
    return 'AuthEvent.userChanged(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseUserChanged &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseUserChangedCopyWith<_$FirebaseUserChanged> get copyWith =>
      __$$FirebaseUserChangedCopyWithImpl<_$FirebaseUserChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logoutRequestedEvent,
    required TResult Function(Option<User> user) userChanged,
  }) {
    return userChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logoutRequestedEvent,
    TResult? Function(Option<User> user)? userChanged,
  }) {
    return userChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logoutRequestedEvent,
    TResult Function(Option<User> user)? userChanged,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutRequestedEvent value) logoutRequestedEvent,
    required TResult Function(FirebaseUserChanged value) userChanged,
  }) {
    return userChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult? Function(FirebaseUserChanged value)? userChanged,
  }) {
    return userChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutRequestedEvent value)? logoutRequestedEvent,
    TResult Function(FirebaseUserChanged value)? userChanged,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(this);
    }
    return orElse();
  }
}

abstract class FirebaseUserChanged implements AuthEvent {
  const factory FirebaseUserChanged(final Option<User> user) =
      _$FirebaseUserChanged;

  Option<User> get user;
  @JsonKey(ignore: true)
  _$$FirebaseUserChangedCopyWith<_$FirebaseUserChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthenticatedStateCopyWith<$Res> {
  factory _$$_AuthenticatedStateCopyWith(_$_AuthenticatedState value,
          $Res Function(_$_AuthenticatedState) then) =
      __$$_AuthenticatedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_AuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthenticatedState>
    implements _$$_AuthenticatedStateCopyWith<$Res> {
  __$$_AuthenticatedStateCopyWithImpl(
      _$_AuthenticatedState _value, $Res Function(_$_AuthenticatedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedState(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedState implements _AuthenticatedState {
  const _$_AuthenticatedState(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedStateCopyWith<_$_AuthenticatedState> get copyWith =>
      __$$_AuthenticatedStateCopyWithImpl<_$_AuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedState implements AuthState {
  const factory _AuthenticatedState(final User user) = _$_AuthenticatedState;

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedStateCopyWith<_$_AuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnauthenticatedStateCopyWith<$Res> {
  factory _$$_UnauthenticatedStateCopyWith(_$_UnauthenticatedState value,
          $Res Function(_$_UnauthenticatedState) then) =
      __$$_UnauthenticatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_UnauthenticatedState>
    implements _$$_UnauthenticatedStateCopyWith<$Res> {
  __$$_UnauthenticatedStateCopyWithImpl(_$_UnauthenticatedState _value,
      $Res Function(_$_UnauthenticatedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnauthenticatedState implements _UnauthenticatedState {
  const _$_UnauthenticatedState();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnauthenticatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnauthenticatedState implements AuthState {
  const factory _UnauthenticatedState() = _$_UnauthenticatedState;
}
