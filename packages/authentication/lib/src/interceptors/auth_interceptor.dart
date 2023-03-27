import 'dart:io';

import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';

/// {@template auth_interceptor}
/// An interceptor that adds the current user's id token to the request headers.
/// {@endtemplate}
class AuthInterceptor extends QueuedInterceptor {
  /// {@macro auth_interceptor}
  AuthInterceptor(this.authRepository);

  /// {@macro auth_repository}
  final AuthRepository authRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await authRepository.currentUser?.getIdToken();

    options.headers
        .putIfAbsent(HttpHeaders.authorizationHeader, () => 'Bearer $token');
    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.badResponse &&
        err.response!.statusCode == 401) {
      await authRepository.signOut();
    }
    return super.onError(err, handler);
  }
}
