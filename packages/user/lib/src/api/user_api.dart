import 'package:dio/dio.dart';
import 'package:user/src/core/core.dart';
import 'package:user/src/dto/dto.dart';

/// {@template user_api}
/// Api for user operations.
/// {@endtemplate}
class UserApi {
  /// {@macro user_api}
  UserApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// {@macro user_api}
  /// Creates a user from the api.
  /// Returns a [UserDto] if the operation was successful.
  /// Throws a [UserDioException] if the operation was not successful.
  /// Throws a [UserSerializationException] if the serialization was not
  /// successful.
  Future<UserDto> createUser(UserDto user) async {
    late final Response<dynamic> res;
    late final Response<dynamic> userResponse;

    try {
      res = await _dio.post<dynamic>(userPath, data: user.toJson());

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserDioException(e);
    }

    try {
      // TODO(lorenzo): esto no debería ser así....
      userResponse = await _dio.get(userPath);
      return UserDto.fromJson(userResponse.data as Map<String, dynamic>);
    } catch (e) {
      throw UserSerializationException();
    }
  }

  /// {@macro user_api}
  ///
  /// Updates a user from the api.
  Future<void> deleteUser() async {
    late final Response<dynamic> res;

    try {
      res = await _dio.delete<dynamic>(
        userPath,
      );

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserDioException(e);
    }
  }

  /// {@macro user_api}
  /// Gets a user from the api.
  /// Returns a [UserDto] if the operation was successful.
  /// Throws a [UserNotFoundException] if the user was not found.
  /// Throws a [UserDioException] if the operation was not successful.
  /// Throws a [UserSerializationException] if the serialization was not
  /// successful.
  Future<UserDto> getUser() async {
    late final Response<dynamic> res;

    try {
      res = await _dio.get<dynamic>(userPath);

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserDioException(e);
    }

    try {
      return UserDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw UserSerializationException();
    }
  }

  /// {@macro user_api}
  ///
  /// Updates a user from the api.
  /// Returns a [UserDto] if the operation was successful.
  /// Throws a [UserNotFoundException] if the user was not found.
  /// Throws a [UserDioException] if the operation was not successful.
  /// Throws a [UserSerializationException] if the serialization was not
  /// successful.
  Future<void> updateUser(UserDto user) async {
    late final Response<dynamic> res;

    try {
      res = await _dio.post<dynamic>(userPath, data: user.toJson());

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserDioException(e);
    }
  }
}
