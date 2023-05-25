import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/interceptors/interceptors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return Dio()
    ..options.baseUrl =
        Platform.isAndroid ? Strings.baseUrlAndroid : Strings.baseUrliOs
    ..interceptors.addAll([
      AuthInterceptor(authRepository),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}
