import 'package:hive/hive.dart';
import 'package:user/user.dart';

/// {@template user_cache}
/// Cache for user operations.
/// {@endtemplate}
class UserCache {
  /// {@macro user_cache}
  UserCache(this._box);

  final Box<Map<String, dynamic>> _box;

  /// Watches the user from the cache.
  ///
  /// Returns a [Stream] of [UserDto]s.\
  /// Throws a [UserCacheException] if the operation was not successful.
  Stream<UserDto?> get user {
    try {
      return _box.watch().map(
        (event) {
          return event.value == null
              ? null
              : UserDto.fromJson(event.value as Map<String, dynamic>);
        },
      );
    } catch (e) {
      throw UserCacheException();
    }
  }

  /// Reads the user from the cache.
  ///
  /// Returns null if the user is not in the cache.\
  /// Returns the [UserDto] if the user is in the cache.\
  /// Throws a [UserCacheException] if the operation was not successful.\
  /// Throws a [UserSerializationException] if the operation was not successful.
  UserDto? read() {
    final Map<String, dynamic>? data;
    try {
      data = _box.get(_box.keys.first);
    } catch (e) {
      throw UserCacheException();
    }

    if (data == null) {
      return null;
    }

    try {
      return UserDto.fromJson(data);
    } catch (e) {
      throw UserSerializationException();
    }
  }

  /// Writes the user to the cache.
  ///
  /// Throws a [UserCacheException] if the operation was not successful.
  Future<void> write(UserDto user) async {
    late final Map<String, dynamic> userJson;

    try {
      userJson = user.toJson();
    } catch (e) {
      throw UserSerializationException();
    }

    try {
      await _box.put(user.id, userJson);
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
