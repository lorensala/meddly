// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPreference _$NotificationPreferenceFromJson(
    Map<String, dynamic> json) {
  return _NotificationPreference.fromJson(json);
}

/// @nodoc
mixin _$NotificationPreference {
  String get name => throw _privateConstructorUsedError;
  dynamic get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPreferenceCopyWith<NotificationPreference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPreferenceCopyWith<$Res> {
  factory $NotificationPreferenceCopyWith(NotificationPreference value,
          $Res Function(NotificationPreference) then) =
      _$NotificationPreferenceCopyWithImpl<$Res, NotificationPreference>;
  @useResult
  $Res call({String name, dynamic isActive});
}

/// @nodoc
class _$NotificationPreferenceCopyWithImpl<$Res,
        $Val extends NotificationPreference>
    implements $NotificationPreferenceCopyWith<$Res> {
  _$NotificationPreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationPreferenceCopyWith<$Res>
    implements $NotificationPreferenceCopyWith<$Res> {
  factory _$$_NotificationPreferenceCopyWith(_$_NotificationPreference value,
          $Res Function(_$_NotificationPreference) then) =
      __$$_NotificationPreferenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, dynamic isActive});
}

/// @nodoc
class __$$_NotificationPreferenceCopyWithImpl<$Res>
    extends _$NotificationPreferenceCopyWithImpl<$Res,
        _$_NotificationPreference>
    implements _$$_NotificationPreferenceCopyWith<$Res> {
  __$$_NotificationPreferenceCopyWithImpl(_$_NotificationPreference _value,
      $Res Function(_$_NotificationPreference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isActive = freezed,
  }) {
    return _then(_$_NotificationPreference(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: freezed == isActive ? _value.isActive! : isActive,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPreference implements _NotificationPreference {
  const _$_NotificationPreference({required this.name, this.isActive = false});

  factory _$_NotificationPreference.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPreferenceFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final dynamic isActive;

  @override
  String toString() {
    return 'NotificationPreference(name: $name, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPreference &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationPreferenceCopyWith<_$_NotificationPreference> get copyWith =>
      __$$_NotificationPreferenceCopyWithImpl<_$_NotificationPreference>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPreferenceToJson(
      this,
    );
  }
}

abstract class _NotificationPreference implements NotificationPreference {
  const factory _NotificationPreference(
      {required final String name,
      final dynamic isActive}) = _$_NotificationPreference;

  factory _NotificationPreference.fromJson(Map<String, dynamic> json) =
      _$_NotificationPreference.fromJson;

  @override
  String get name;
  @override
  dynamic get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationPreferenceCopyWith<_$_NotificationPreference> get copyWith =>
      throw _privateConstructorUsedError;
}
