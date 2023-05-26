import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user/user.dart';

class UserCache {
  UserCache(this._box);

  final Box<UserDto> _box;

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

  Future<void> write(UserDto user) async {
    try {
      await _box.put(userKey, user);
    } catch (e) {
      throw UserCacheException();
    }
  }

  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      throw UserCacheException();
    }
  }
}
