import 'dart:io' show HttpHeaders, Platform;

import 'package:dio/dio.dart';
import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meddly/core/core.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this.authRepository);

  final FirebaseAuthRepository authRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await authRepository.getIdToken();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    final baseUrl =
        Platform.isAndroid ? Strings.baseUrlAndroid : Strings.baseUrliOs;

    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      'device': deviceToken,
    };

    options
      ..baseUrl = baseUrl
      ..headers = headers;

    //! TODO(me): Remove!
    await Future.delayed(const Duration(milliseconds: 500));

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
