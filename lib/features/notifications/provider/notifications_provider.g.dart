// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsCacheHash() =>
    r'da6f40f94bb427a47fa3028a2d47d664321ea423';

/// See also [notificationsCache].
@ProviderFor(notificationsCache)
final notificationsCacheProvider =
    AutoDisposeProvider<NotificationsCache>.internal(
  notificationsCache,
  name: r'notificationsCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationsCacheRef = AutoDisposeProviderRef<NotificationsCache>;
String _$notificationPreferenceHash() =>
    r'98253abc016a169ad92c9d148e0fd7ecf823ce9b';

/// See also [notificationPreference].
@ProviderFor(notificationPreference)
final notificationPreferenceProvider =
    AutoDisposeProvider<NotificationPreference>.internal(
  notificationPreference,
  name: r'notificationPreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationPreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationPreferenceRef
    = AutoDisposeProviderRef<NotificationPreference>;
String _$isNotificationPreferenceOnHash() =>
    r'66a155a340ebfed8dd5830a206154c637c9a6acb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef IsNotificationPreferenceOnRef = AutoDisposeProviderRef<bool>;

/// See also [isNotificationPreferenceOn].
@ProviderFor(isNotificationPreferenceOn)
const isNotificationPreferenceOnProvider = IsNotificationPreferenceOnFamily();

/// See also [isNotificationPreferenceOn].
class IsNotificationPreferenceOnFamily extends Family<bool> {
  /// See also [isNotificationPreferenceOn].
  const IsNotificationPreferenceOnFamily();

  /// See also [isNotificationPreferenceOn].
  IsNotificationPreferenceOnProvider call({
    required NotificationPreference preference,
  }) {
    return IsNotificationPreferenceOnProvider(
      preference: preference,
    );
  }

  @override
  IsNotificationPreferenceOnProvider getProviderOverride(
    covariant IsNotificationPreferenceOnProvider provider,
  ) {
    return call(
      preference: provider.preference,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isNotificationPreferenceOnProvider';
}

/// See also [isNotificationPreferenceOn].
class IsNotificationPreferenceOnProvider extends AutoDisposeProvider<bool> {
  /// See also [isNotificationPreferenceOn].
  IsNotificationPreferenceOnProvider({
    required this.preference,
  }) : super.internal(
          (ref) => isNotificationPreferenceOn(
            ref,
            preference: preference,
          ),
          from: isNotificationPreferenceOnProvider,
          name: r'isNotificationPreferenceOnProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isNotificationPreferenceOnHash,
          dependencies: IsNotificationPreferenceOnFamily._dependencies,
          allTransitiveDependencies:
              IsNotificationPreferenceOnFamily._allTransitiveDependencies,
        );

  final NotificationPreference preference;

  @override
  bool operator ==(Object other) {
    return other is IsNotificationPreferenceOnProvider &&
        other.preference == preference;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, preference.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$notificationsApiHash() => r'8eb14877b88fc9ba62f436c3117126b8642896aa';

/// See also [notificationsApi].
@ProviderFor(notificationsApi)
final notificationsApiProvider = AutoDisposeProvider<NotificationsApi>.internal(
  notificationsApi,
  name: r'notificationsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationsApiRef = AutoDisposeProviderRef<NotificationsApi>;
String _$notificationsRepositoryHash() =>
    r'1f0d5ffd1e3fa514faa8601929f419d1a95cf1f4';

/// See also [notificationsRepository].
@ProviderFor(notificationsRepository)
final notificationsRepositoryProvider =
    AutoDisposeProvider<NotificationsRepository>.internal(
  notificationsRepository,
  name: r'notificationsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationsRepositoryRef
    = AutoDisposeProviderRef<NotificationsRepository>;
String _$notificationPreferencesHash() =>
    r'03e56be05cd93e9eeb8f55b613d54c461a5c89d2';

/// See also [notificationPreferences].
@ProviderFor(notificationPreferences)
final notificationPreferencesProvider =
    AutoDisposeProvider<AsyncValue<List<NotificationPreference>>>.internal(
  notificationPreferences,
  name: r'notificationPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationPreferencesRef
    = AutoDisposeProviderRef<AsyncValue<List<NotificationPreference>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions