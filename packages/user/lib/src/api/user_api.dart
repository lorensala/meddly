import 'package:dio/dio.dart';
import 'package:user/src/core/core.dart';
import 'package:user/src/dto/dto.dart';

class UserApi {
  UserApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<UserDto> createUser(UserDto user) async {
    late final Response<dynamic> res;
    late final Response<dynamic> userResponse;

    try {
      res = await _dio.post<dynamic>(userPath, data: user.toJson());

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserException.fromDioError(e);
    } catch (e) {
      throw UserUnknownException();
    }

    try {
      userResponse = await _dio.get(userPath);
      return UserDto.fromJson(userResponse.data as Map<String, dynamic>);
    } catch (e) {
      throw UserSerializationException();
    }
  }

  Future<void> deleteUser() async {
    try {
      await _dio.delete<dynamic>(
        userPath,
      );
    } on DioError catch (e) {
      throw UserException.fromDioError(e);
    } catch (e) {
      throw UserUnknownException();
    }
  }

  Future<UserDto> getUser() async {
    late final Response<dynamic> res;

    try {
      res = await _dio.get<dynamic>(userPath);

      if (res.statusCode == 404) {
        throw UserNotFoundException();
      }
    } on DioError catch (e) {
      throw UserException.fromDioError(e);
    } catch (e) {
      throw UserUnknownException();
    }

    try {
      return UserDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw UserSerializationException();
    }
  }

  Future<void> updateUser(UserDto user) async {
    try {
      await _dio.post<dynamic>(userPath, data: user.toJson());
    } on DioError catch (e) {
      throw UserException.fromDioError(e);
    } catch (e) {
      throw UserUnknownException();
    }
  }
}
