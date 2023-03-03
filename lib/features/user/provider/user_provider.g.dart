// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userApiHash() => r'75c30864293ca9290980d74c0d3790faa543c42c';

/// See also [userApi].
@ProviderFor(userApi)
final userApiProvider = AutoDisposeProvider<UserApi>.internal(
  userApi,
  name: r'userApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserApiRef = AutoDisposeProviderRef<UserApi>;
String _$userCacheHash() => r'1a1a048ddd80233af217e87639f3ac75e61dd63f';

/// See also [userCache].
@ProviderFor(userCache)
final userCacheProvider = AutoDisposeProvider<UserCache>.internal(
  userCache,
  name: r'userCacheProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserCacheRef = AutoDisposeProviderRef<UserCache>;
String _$userHash() => r'da6cffca1a006d98d6cbf78e6d48b865f827ef25';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeProvider<Option<User>>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = AutoDisposeProviderRef<Option<User>>;
String _$userRepositoryHash() => r'2eb62b7befa9c63f0b1cfb68394825ddf57cb53a';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$checkIfUserExistHash() => r'f5f746bf69925818807a8043c71bd90a8e47eb06';

/// See also [checkIfUserExist].
@ProviderFor(checkIfUserExist)
final checkIfUserExistProvider = AutoDisposeFutureProvider<bool>.internal(
  checkIfUserExist,
  name: r'checkIfUserExistProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkIfUserExistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckIfUserExistRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
