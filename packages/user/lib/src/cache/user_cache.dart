import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user/user.dart';

/// {@template user_cache}
/// Cache for user operations.
/// {@endtemplate}
class UserCache {
  /// {@macro user_cache}
  UserCache(this._box);

  final Box<UserDto> _box;

  /// Watches the user from the cache.
  ///
  /// Returns a [Stream] of [UserDto]s.\
  /// Throws a [UserCacheException] if the operation was not successful.
  Stream<UserDto?> get user {
    try {
      return _box.watch(key: userKey).map(
        (event) {
          return event.value == null ? null : event.value as UserDto;
        },
      ).startWith(read());
    } catch (e) {
      return Stream.error(e);
    }
  }

  /// Reads the user from the cache.
  ///
  /// Returns null if the user is not in the cache.\
  /// Returns the [UserDto] if the user is in the cache.\
  /// Throws a [UserCacheException] if the operation was not successful.\
  /// Throws a [UserSerializationException] if the operation was not successful.
  UserDto? read() {
    final UserDto? user;
    try {
      user = _box.get(userKey);
    } catch (e) {
      throw UserCacheException();
    }

    if (user == null) {
      return null;
    }

    return user;
  }

  /// Writes the user to the cache.
  ///
  /// Throws a [UserCacheException] if the operation was not successful.
  Future<void> write(UserDto user) async {
    try {
      await _box.put(userKey, user);
    } catch (e) {
      throw UserCacheException();
    }
  }

  /// Clears the cache.
  ///
  /// Throws a [UserCacheException] if the operation was not successful.
  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      throw UserCacheException();
    }
  }
}
