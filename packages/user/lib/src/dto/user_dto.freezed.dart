// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get invitation => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get sex => throw _privateConstructorUsedError;
  @HiveField(7)
  double? get height => throw _privateConstructorUsedError;
  @HiveField(8)
  double? get weight => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get birth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String? firstName,
      @HiveField(3) String? lastName,
      @HiveField(4) String? invitation,
      @HiveField(5) String? phone,
      @HiveField(6) bool? sex,
      @HiveField(7) double? height,
      @HiveField(8) double? weight,
      @HiveField(9) String? birth});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? invitation = freezed,
    Object? phone = freezed,
    Object? sex = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? birth = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation: freezed == invitation
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as bool?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String? firstName,
      @HiveField(3) String? lastName,
      @HiveField(4) String? invitation,
      @HiveField(5) String? phone,
      @HiveField(6) bool? sex,
      @HiveField(7) double? height,
      @HiveField(8) double? weight,
      @HiveField(9) String? birth});
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UserDto>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? invitation = freezed,
    Object? phone = freezed,
    Object? sex = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? birth = freezed,
  }) {
    return _then(_$_UserDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation: freezed == invitation
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as bool?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) this.firstName,
      @HiveField(3) this.lastName,
      @HiveField(4) this.invitation,
      @HiveField(5) this.phone,
      @HiveField(6) this.sex,
      @HiveField(7) this.height,
      @HiveField(8) this.weight,
      @HiveField(9) this.birth})
      : super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String? firstName;
  @override
  @HiveField(3)
  final String? lastName;
  @override
  @HiveField(4)
  final String? invitation;
  @override
  @HiveField(5)
  final String? phone;
  @override
  @HiveField(6)
  final bool? sex;
  @override
  @HiveField(7)
  final double? height;
  @override
  @HiveField(8)
  final double? weight;
  @override
  @HiveField(9)
  final String? birth;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, firstName: $firstName, lastName: $lastName, invitation: $invitation, phone: $phone, sex: $sex, height: $height, weight: $weight, birth: $birth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.invitation, invitation) ||
                other.invitation == invitation) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.birth, birth) || other.birth == birth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName, lastName,
      invitation, phone, sex, height, weight, birth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      __$$_UserDtoCopyWithImpl<_$_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) final String? firstName,
      @HiveField(3) final String? lastName,
      @HiveField(4) final String? invitation,
      @HiveField(5) final String? phone,
      @HiveField(6) final bool? sex,
      @HiveField(7) final double? height,
      @HiveField(8) final double? weight,
      @HiveField(9) final String? birth}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String? get firstName;
  @override
  @HiveField(3)
  String? get lastName;
  @override
  @HiveField(4)
  String? get invitation;
  @override
  @HiveField(5)
  String? get phone;
  @override
  @HiveField(6)
  bool? get sex;
  @override
  @HiveField(7)
  double? get height;
  @override
  @HiveField(8)
  double? get weight;
  @override
  @HiveField(9)
  String? get birth;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
