import 'package:dio/dio.dart';
import 'package:supervisor/src/core/constants.dart';
import 'package:supervisor/src/core/exceptions.dart';
import 'package:user/user.dart';

class SupervisorApi {
  const SupervisorApi({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<User>> getSupervisors() async {
    try {
      final res = await _dio.get<List<dynamic>>(
        supervisorPath,
      );

      final List<User> supervisors = [];

      if (res.data == null) {
        return supervisors;
      }

      for (var item in res.data!) {
        supervisors
            .add(UserDto.fromJson(item as Map<String, dynamic>).toDomain());
      }
      return supervisors;
    } on DioError catch (e) {
      throw SupervisorException.fromDioError(e);
    } catch (e) {
      throw SupervisorUnknownException();
    }
  }

  Future<List<User>> getSupervised() async {
    try {
      final res = await _dio.get<List<dynamic>>(
        supervisedPath,
      );

      final List<User> supervisedUsers = [];

      if (res.data == null) {
        return supervisedUsers;
      }

      for (var item in res.data!) {
        supervisedUsers
            .add(UserDto.fromJson(item as Map<String, dynamic>).toDomain());
      }
      return supervisedUsers;
    } on DioError catch (e) {
      throw SupervisorException.fromDioError(e);
    } catch (e) {
      throw SupervisorUnknownException();
    }
  }

  Future<void> acceptInvitation(String code) async {
    try {
      await _dio.post<void>(invitationPath, data: {
        'code': code,
      });
    } on DioError catch (e) {
      throw SupervisorException.fromDioError(e);
    } catch (e) {
      throw SupervisorUnknownException();
    }
  }

  Future<void> deleteSupervisor(String id) async {
    try {
      await _dio.delete<void>(
        '$supervisorPath/$id',
      );
    } on DioError catch (e) {
      throw SupervisorException.fromDioError(e);
    } catch (e) {
      throw SupervisorUnknownException();
    }
  }

  Future<void> deleteSupervised(String id) async {
    try {
      await _dio.delete<void>(
        '$supervisedPath/$id',
      );
    } on DioError catch (e) {
      throw SupervisorException.fromDioError(e);
    } catch (e) {
      throw SupervisorUnknownException();
    }
  }
}
