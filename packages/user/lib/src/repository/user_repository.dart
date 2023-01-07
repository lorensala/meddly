import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:user/src/cache/user_cache.dart';
import 'package:user/src/core/failures.dart';
import 'package:user/user.dart';

/// {@template user_repository}
/// Repository for user operations.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  const UserRepository({required UserApi api, required UserCache cache})
      : _api = api,
        _cache = cache;

  /// {@macro user_api}
  final UserApi _api;

  /// {@macro user_cache}
  final UserCache _cache;

  /// Watches the user from the cache.
  Stream<Option<User>> get user =>
      _cache.user.map((user) => user == null ? none() : some(user.toDomain()));

  /// Creates a user
  ///
  /// Returns a [Unit] if the operation was successful.
  /// Throws a [UserFailure] if the operation was not successful.
  Future<Either<UserFailure, Unit>> createUser(User user) async {
    try {
      final createdUser = await _api.createUser(UserDto.fromDomain(user));

      await _cache.write(createdUser);
      return const Right(unit);
    } on UserNotFoundException {
      return const Left(UserFailure.notFound());
    } on UserDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
          return const Left(UserFailure.timeout());

        case DioErrorType.sendTimeout:
          return const Left(UserFailure.sendTimeout());

        case DioErrorType.receiveTimeout:
          return const Left(UserFailure.receiveTimeout());

        case DioErrorType.response:
          return const Left(UserFailure.response());

        case DioErrorType.cancel:
          return const Left(UserFailure.cancel());

        case DioErrorType.other:
          return const Left(UserFailure.unknown());
      }
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }

  /// Updates a user
  ///
  /// Returns a [Unit] if the operation was successful.
  /// Throws a [UserFailure] if the operation was not successful.
  Future<Either<UserFailure, Unit>> deleteUser() async {
    try {
      await _api.deleteUser();

      await _cache.clear();

      return const Right(unit);
    } on UserNotFoundException {
      return const Left(UserFailure.notFound());
    } on UserDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
          return const Left(UserFailure.timeout());

        case DioErrorType.sendTimeout:
          return const Left(UserFailure.sendTimeout());

        case DioErrorType.receiveTimeout:
          return const Left(UserFailure.receiveTimeout());

        case DioErrorType.response:
          return const Left(UserFailure.response());

        case DioErrorType.cancel:
          return const Left(UserFailure.cancel());

        case DioErrorType.other:
          return const Left(UserFailure.unknown());
      }
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }

  /// Gets a user from cache.
  ///
  /// Returns a [User] if the operation was successful.
  /// Throws a [UserFailure] if the operation was not successful.
  Either<UserFailure, User> getUser() {
    try {
      final user = _cache.read();
      if (user == null) {
        return const Left(UserFailure.notFound());
      }
      return Right(user.toDomain());
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }

  /// Updates a user
  ///
  /// Returns a [User] if the operation was successful.
  /// Throws a [UserFailure] if the operation was not successful.
  Future<Either<UserFailure, Unit>> updateUser(User user) async {
    try {
      await _api.updateUser(UserDto.fromDomain(user));

      await _cache.write(UserDto.fromDomain(user));

      return const Right(unit);
    } on UserNotFoundException {
      return const Left(UserFailure.notFound());
    } on UserDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
          return const Left(UserFailure.timeout());

        case DioErrorType.sendTimeout:
          return const Left(UserFailure.sendTimeout());

        case DioErrorType.receiveTimeout:
          return const Left(UserFailure.receiveTimeout());

        case DioErrorType.response:
          return const Left(UserFailure.response());

        case DioErrorType.cancel:
          return const Left(UserFailure.cancel());

        case DioErrorType.other:
          return const Left(UserFailure.unknown());
      }
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }
}
