// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'00df1a3183e0069f9617968e5eb845914ca36a88';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$hiveHash() => r'5eafbb7cb9ace86766cf916d84e82ba835140af4';

/// See also [hive].
@ProviderFor(hive)
final hiveProvider = AutoDisposeFutureProvider<HiveInterface>.internal(
  hive,
  name: r'hiveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HiveRef = AutoDisposeFutureProviderRef<HiveInterface>;
String _$userBoxHash() => r'286be4578fde61e4c25c8d611eb70f3e48fe037c';

/// See also [userBox].
@ProviderFor(userBox)
final userBoxProvider = AutoDisposeProvider<Box<UserDto>>.internal(
  userBox,
  name: r'userBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserBoxRef = AutoDisposeProviderRef<Box<UserDto>>;
String _$preferencesBoxHash() => r'c5669656e59c7b98e3026b83bdf3b31be16c10c8';

/// See also [preferencesBox].
@ProviderFor(preferencesBox)
final preferencesBoxProvider = AutoDisposeProvider<Box<List<String>>>.internal(
  preferencesBox,
  name: r'preferencesBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PreferencesBoxRef = AutoDisposeProviderRef<Box<List<String>>>;
String _$medicineBoxHash() => r'64603784521f452e64411a6516f6599b7a096f1a';

/// See also [medicineBox].
@ProviderFor(medicineBox)
final medicineBoxProvider =
    AutoDisposeProvider<Box<List<MedicineDto>>>.internal(
  medicineBox,
  name: r'medicineBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$medicineBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MedicineBoxRef = AutoDisposeProviderRef<Box<List<MedicineDto>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
