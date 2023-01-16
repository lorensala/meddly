// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Option<User> nothingOrUser) userReceived,
    required TResult Function(User user) createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Option<User> nothingOrUser)? userReceived,
    TResult? Function(User user)? createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Option<User> nothingOrUser)? userReceived,
    TResult Function(User user)? createUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_UserReceived value) userReceived,
    required TResult Function(_CreateUser value) createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_UserReceived value)? userReceived,
    TResult? Function(_CreateUser value)? createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_UserReceived value)? userReceived,
    TResult Function(_CreateUser value)? createUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

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
    extends _$UserEventCopyWithImpl<$Res, _$_Watch>
    implements _$$_WatchCopyWith<$Res> {
  __$$_WatchCopyWithImpl(_$_Watch _value, $Res Function(_$_Watch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Watch implements _Watch {
  const _$_Watch();

  @override
  String toString() {
    return 'UserEvent.watch()';
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
    required TResult Function(Option<User> nothingOrUser) userReceived,
    required TResult Function(User user) createUser,
  }) {
    return watch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Option<User> nothingOrUser)? userReceived,
    TResult? Function(User user)? createUser,
  }) {
    return watch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Option<User> nothingOrUser)? userReceived,
    TResult Function(User user)? createUser,
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
    required TResult Function(_UserReceived value) userReceived,
    required TResult Function(_CreateUser value) createUser,
  }) {
    return watch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_UserReceived value)? userReceived,
    TResult? Function(_CreateUser value)? createUser,
  }) {
    return watch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_UserReceived value)? userReceived,
    TResult Function(_CreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (watch != null) {
      return watch(this);
    }
    return orElse();
  }
}

abstract class _Watch implements UserEvent {
  const factory _Watch() = _$_Watch;
}

/// @nodoc
abstract class _$$_UserReceivedCopyWith<$Res> {
  factory _$$_UserReceivedCopyWith(
          _$_UserReceived value, $Res Function(_$_UserReceived) then) =
      __$$_UserReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({Option<User> nothingOrUser});
}

/// @nodoc
class __$$_UserReceivedCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_UserReceived>
    implements _$$_UserReceivedCopyWith<$Res> {
  __$$_UserReceivedCopyWithImpl(
      _$_UserReceived _value, $Res Function(_$_UserReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nothingOrUser = null,
  }) {
    return _then(_$_UserReceived(
      null == nothingOrUser
          ? _value.nothingOrUser
          : nothingOrUser // ignore: cast_nullable_to_non_nullable
              as Option<User>,
    ));
  }
}

/// @nodoc

class _$_UserReceived implements _UserReceived {
  const _$_UserReceived(this.nothingOrUser);

  @override
  final Option<User> nothingOrUser;

  @override
  String toString() {
    return 'UserEvent.userReceived(nothingOrUser: $nothingOrUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserReceived &&
            (identical(other.nothingOrUser, nothingOrUser) ||
                other.nothingOrUser == nothingOrUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nothingOrUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserReceivedCopyWith<_$_UserReceived> get copyWith =>
      __$$_UserReceivedCopyWithImpl<_$_UserReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Option<User> nothingOrUser) userReceived,
    required TResult Function(User user) createUser,
  }) {
    return userReceived(nothingOrUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Option<User> nothingOrUser)? userReceived,
    TResult? Function(User user)? createUser,
  }) {
    return userReceived?.call(nothingOrUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Option<User> nothingOrUser)? userReceived,
    TResult Function(User user)? createUser,
    required TResult orElse(),
  }) {
    if (userReceived != null) {
      return userReceived(nothingOrUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_UserReceived value) userReceived,
    required TResult Function(_CreateUser value) createUser,
  }) {
    return userReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_UserReceived value)? userReceived,
    TResult? Function(_CreateUser value)? createUser,
  }) {
    return userReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_UserReceived value)? userReceived,
    TResult Function(_CreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (userReceived != null) {
      return userReceived(this);
    }
    return orElse();
  }
}

abstract class _UserReceived implements UserEvent {
  const factory _UserReceived(final Option<User> nothingOrUser) =
      _$_UserReceived;

  Option<User> get nothingOrUser;
  @JsonKey(ignore: true)
  _$$_UserReceivedCopyWith<_$_UserReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateUserCopyWith<$Res> {
  factory _$$_CreateUserCopyWith(
          _$_CreateUser value, $Res Function(_$_CreateUser) then) =
      __$$_CreateUserCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_CreateUserCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_CreateUser>
    implements _$$_CreateUserCopyWith<$Res> {
  __$$_CreateUserCopyWithImpl(
      _$_CreateUser _value, $Res Function(_$_CreateUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_CreateUser(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_CreateUser implements _CreateUser {
  const _$_CreateUser(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserEvent.createUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUser &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUserCopyWith<_$_CreateUser> get copyWith =>
      __$$_CreateUserCopyWithImpl<_$_CreateUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watch,
    required TResult Function(Option<User> nothingOrUser) userReceived,
    required TResult Function(User user) createUser,
  }) {
    return createUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watch,
    TResult? Function(Option<User> nothingOrUser)? userReceived,
    TResult? Function(User user)? createUser,
  }) {
    return createUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watch,
    TResult Function(Option<User> nothingOrUser)? userReceived,
    TResult Function(User user)? createUser,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Watch value) watch,
    required TResult Function(_UserReceived value) userReceived,
    required TResult Function(_CreateUser value) createUser,
  }) {
    return createUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Watch value)? watch,
    TResult? Function(_UserReceived value)? userReceived,
    TResult? Function(_CreateUser value)? createUser,
  }) {
    return createUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Watch value)? watch,
    TResult Function(_UserReceived value)? userReceived,
    TResult Function(_CreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(this);
    }
    return orElse();
  }
}

abstract class _CreateUser implements UserEvent {
  const factory _CreateUser(final User user) = _$_CreateUser;

  User get user;
  @JsonKey(ignore: true)
  _$$_CreateUserCopyWith<_$_CreateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) success,
    required TResult Function(UserFailure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User user)? success,
    TResult? Function(UserFailure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? success,
    TResult Function(UserFailure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'UserState.loading()';
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
    required TResult Function() loading,
    required TResult Function(User user) success,
    required TResult Function(UserFailure failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User user)? success,
    TResult? Function(UserFailure failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? success,
    TResult Function(UserFailure failure)? failure,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends UserState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Loaded(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(this.user) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.success(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) success,
    required TResult Function(UserFailure failure) failure,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User user)? success,
    TResult? Function(UserFailure failure)? failure,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? success,
    TResult Function(UserFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends UserState {
  const factory _Loaded(final User user) = _$_Loaded;
  const _Loaded._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({UserFailure failure});

  $UserFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Failure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as UserFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserFailureCopyWith<$Res> get failure {
    return $UserFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.failure) : super._();

  @override
  final UserFailure failure;

  @override
  String toString() {
    return 'UserState.failure(failure: $failure)';
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
    required TResult Function() loading,
    required TResult Function(User user) success,
    required TResult Function(UserFailure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(User user)? success,
    TResult? Function(UserFailure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? success,
    TResult Function(UserFailure failure)? failure,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends UserState {
  const factory _Failure(final UserFailure failure) = _$_Failure;
  const _Failure._() : super._();

  UserFailure get failure;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
