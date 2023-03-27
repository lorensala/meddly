import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
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
  Stream<Option<User>> get user => _cache.user
      .map<Option<User>>(
        (user) => user == null ? none() : some(user.toDomain()),
      )
      .onErrorReturnWith((error, stackTrace) => none());

  /// Creates a user
  ///
  /// Returns a [Unit] if the operation was successful.\
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
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const UserFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const UserFailure.response());
        case DioErrorType.cancel:
          return left(const UserFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const UserFailure.unknown());
        case DioErrorType.connectionError:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const UserFailure.unknown());
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
  /// Returns a [Unit] if the operation was successful.\
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
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const UserFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const UserFailure.response());
        case DioErrorType.cancel:
          return left(const UserFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const UserFailure.unknown());
        case DioErrorType.connectionError:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const UserFailure.unknown());
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
  /// Returns a [User] if the operation was successful.\
  /// Throws a [UserFailure] if the operation was not successful.
  Either<UserFailure, User?> getUser() {
    try {
      final user = _cache.read();

      return Right(user?.toDomain());
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }

  /// Fetch user from database
  ///
  /// Returns a [User] if the operation was successful.\
  /// Throws a [UserFailure] if the operation was not successful.
  Future<Either<UserFailure, User>> fetchUser() async {
    try {
      final user = await _api.getUser();

      await _cache.write(user);

      return Right(user.toDomain());
    } on UserNotFoundException {
      return const Left(UserFailure.notFound());
    } on UserDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const UserFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const UserFailure.response());
        case DioErrorType.cancel:
          return left(const UserFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const UserFailure.unknown());
        case DioErrorType.connectionError:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const UserFailure.unknown());
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
  /// Returns a [Unit] if the operation was successful.\
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
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const UserFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const UserFailure.response());
        case DioErrorType.cancel:
          return left(const UserFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const UserFailure.unknown());
        case DioErrorType.connectionError:
          return left(const UserFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const UserFailure.unknown());
      }
    } on UserCacheException {
      return const Left(UserFailure.cache());
    } on UserSerializationException {
      return const Left(UserFailure.serialization());
    } catch (e) {
      return const Left(UserFailure.unknown());
    }
  }

  /// Clears the user cache.
  void clearCache() {
    _cache.clear();
  }
}
