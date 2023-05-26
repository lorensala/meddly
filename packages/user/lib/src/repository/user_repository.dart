import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:user/user.dart';

class UserRepository {
  const UserRepository({required UserApi api, required UserCache cache})
      : _api = api,
        _cache = cache;

  final UserApi _api;

  final UserCache _cache;

  Stream<User?> get user => _cache.user
      .map<User?>(
        (user) => user?.toDomain(),
      )
      .onErrorReturnWith((error, stackTrace) => null);

  Future<(UserException?, void)> createUser(User user) async {
    try {
      final createdUser = await _api.createUser(UserDto.fromDomain(user));

      await _cache.write(createdUser);
      return (null, null);
    } on UserException catch (e) {
      return (e, null);
    } catch (e) {
      return (UserUnknownException(), null);
    }
  }

  Future<(UserException?, void)> deleteUser() async {
    try {
      await _api.deleteUser();

      await _cache.clear();

      return (null, null);
    } on UserException catch (e) {
      return (e, null);
    } catch (e) {
      return (UserUnknownException(), null);
    }
  }

  (UserException?, User?) getUser() {
    try {
      final user = _cache.read();

      return (null, user?.toDomain());
    } on UserException catch (e) {
      return (e, null);
    } catch (e) {
      return (UserUnknownException(), null);
    }
  }

  Future<(UserException?, User?)> fetchUser() async {
    try {
      final user = await _api.getUser();

      await _cache.write(user);

      return (null, user.toDomain());
    } on UserException catch (e) {
      return (e, null);
    } catch (e) {
      return (UserUnknownException(), null);
    }
  }

  Future<(UserException?, void)> updateUser(User user) async {
    try {
      await _api.updateUser(UserDto.fromDomain(user));

      await _cache.write(UserDto.fromDomain(user));

      return (null, null);
    } on UserException catch (e) {
      return (e, null);
    } catch (e) {
      return (UserUnknownException(), null);
    }
  }

  void clearCache() {
    _cache.clear();
  }
}
