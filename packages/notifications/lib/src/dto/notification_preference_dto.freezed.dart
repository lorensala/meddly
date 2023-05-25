// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preference_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPreferenceDto _$NotificationPreferenceDtoFromJson(
    Map<String, dynamic> json) {
  return _NotificationPrefenceDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationPreferenceDto {
  List<String> get preferences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPreferenceDtoCopyWith<NotificationPreferenceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPreferenceDtoCopyWith<$Res> {
  factory $NotificationPreferenceDtoCopyWith(NotificationPreferenceDto value,
          $Res Function(NotificationPreferenceDto) then) =
      _$NotificationPreferenceDtoCopyWithImpl<$Res, NotificationPreferenceDto>;
  @useResult
  $Res call({List<String> preferences});
}

/// @nodoc
class _$NotificationPreferenceDtoCopyWithImpl<$Res,
        $Val extends NotificationPreferenceDto>
    implements $NotificationPreferenceDtoCopyWith<$Res> {
  _$NotificationPreferenceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
  }) {
    return _then(_value.copyWith(
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationPrefenceDtoCopyWith<$Res>
    implements $NotificationPreferenceDtoCopyWith<$Res> {
  factory _$$_NotificationPrefenceDtoCopyWith(_$_NotificationPrefenceDto value,
          $Res Function(_$_NotificationPrefenceDto) then) =
      __$$_NotificationPrefenceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> preferences});
}

/// @nodoc
class __$$_NotificationPrefenceDtoCopyWithImpl<$Res>
    extends _$NotificationPreferenceDtoCopyWithImpl<$Res,
        _$_NotificationPrefenceDto>
    implements _$$_NotificationPrefenceDtoCopyWith<$Res> {
  __$$_NotificationPrefenceDtoCopyWithImpl(_$_NotificationPrefenceDto _value,
      $Res Function(_$_NotificationPrefenceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
  }) {
    return _then(_$_NotificationPrefenceDto(
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPrefenceDto extends _NotificationPrefenceDto {
  const _$_NotificationPrefenceDto({final List<String> preferences = const []})
      : _preferences = preferences,
        super._();

  factory _$_NotificationPrefenceDto.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPrefenceDtoFromJson(json);

  final List<String> _preferences;
  @override
  @JsonKey()
  List<String> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  @override
  String toString() {
    return 'NotificationPreferenceDto(preferences: $preferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPrefenceDto &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_preferences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationPrefenceDtoCopyWith<_$_NotificationPrefenceDto>
      get copyWith =>
          __$$_NotificationPrefenceDtoCopyWithImpl<_$_NotificationPrefenceDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPrefenceDtoToJson(
      this,
    );
  }
}

abstract class _NotificationPrefenceDto extends NotificationPreferenceDto {
  const factory _NotificationPrefenceDto({final List<String> preferences}) =
      _$_NotificationPrefenceDto;
  const _NotificationPrefenceDto._() : super._();

  factory _NotificationPrefenceDto.fromJson(Map<String, dynamic> json) =
      _$_NotificationPrefenceDto.fromJson;

  @override
  List<String> get preferences;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationPrefenceDtoCopyWith<_$_NotificationPrefenceDto>
      get copyWith => throw _privateConstructorUsedError;
}
