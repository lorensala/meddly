import 'package:dio/dio.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/interceptors/interceptors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return Dio()
    ..interceptors.addAll([
      AuthInterceptor(authRepository),
      LogInterceptor(requestBody: true, responseBody: true)
    ])
    ..options.validateStatus = (code) => code == 200 || code == 201;
}
