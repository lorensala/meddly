import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user/src/core/core.dart';
import 'package:user/src/models/models.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// {@template user_dto}
/// Data transfer object for user operations.
/// {@endtemplate}
@freezed
class UserDto with _$UserDto {
  /// {@macro user_dto}
  const factory UserDto({
    required String id,
    required String email,
    String? firstName,
    String? lastName,
    String? invitation,
    String? phone,
    bool? sex,
    double? height,
    double? weight,
    String? birth,
  }) = _UserDto;

  /// Converts a [User] to a [UserDto].
  /// Returns a [UserDto] if the operation was successful.
  /// Throws a [UserDtoException] if the operation was not successful.
  factory UserDto.fromDomain(User user) {
    try {
      return UserDto(
        id: user.uid,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        phone: user.phone,
        sex: user.sex.toBool(),
        height: user.height,
        weight: user.weight,
        birth: user.birth,
        invitation: user.invitation,
      );
    } catch (e) {
      throw UserDtoException();
    }
  }

  /// Converts a [Map] to a [UserDto].
  /// Returns a [UserDto] if the operation was successful.
  /// Throws a [UserDtoException] if the operation was not successful.
  factory UserDto.fromJson(Map<String, dynamic> json) = _UserDto.fromJson;

  const UserDto._();

  /// Converts a [UserDto] to a [User].
  /// Returns a [User] if the operation was successful.
  /// Throws a [UserDtoException] if the operation was not successful.
  User toDomain() {
    try {
      return User(
        uid: id,
        email: email,
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        phone: phone ?? '',
        sex: Sex.fromBool(value: sex),
        height: height ?? 0,
        weight: weight ?? 0,
        birth: birth ?? '',
      );
    } catch (e) {
      throw UserDtoException();
    }
  }
}
