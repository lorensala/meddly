// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationPreferenceHash() =>
    r'50bfa6745b139f787c4afdb42343bd7cc2ec2aa3';

/// See also [notificationPreference].
@ProviderFor(notificationPreference)
final notificationPreferenceProvider =
    AutoDisposeProvider<NotificationPreference>.internal(
  notificationPreference,
  name: r'notificationPreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationPreferenceHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef NotificationPreferenceRef
    = AutoDisposeProviderRef<NotificationPreference>;
String _$filteredNotificationsHash() =>
    r'39d2003c218807be6d52fb1a634c3485838b4c33';

/// See also [filteredNotifications].
@ProviderFor(filteredNotifications)
final filteredNotificationsProvider =
    AutoDisposeProvider<List<Notification>>.internal(
  filteredNotifications,
  name: r'filteredNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredNotificationsRef = AutoDisposeProviderRef<List<Notification>>;
String _$hasUnreadNotificationsHash() =>
    r'315ef732d62724c8f7b6675903b66f904a3a46d1';

/// See also [hasUnreadNotifications].
@ProviderFor(hasUnreadNotifications)
final hasUnreadNotificationsProvider = AutoDisposeProvider<bool>.internal(
  hasUnreadNotifications,
  name: r'hasUnreadNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasUnreadNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HasUnreadNotificationsRef = AutoDisposeProviderRef<bool>;
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
String _$notificationHash() => r'07f13e3ceb1f4b376c219d21e7e23a1b342eeeb9';

/// See also [notification].
@ProviderFor(notification)
final notificationProvider = AutoDisposeProvider<Notification>.internal(
  notification,
  name: r'notificationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notificationHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef NotificationRef = AutoDisposeProviderRef<Notification>;
String _$notificationsRepositoryHash() =>
    r'269e63ef61d7b4c6e2c0ecbcfef0e6669f3e6a05';

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
String _$localNotificationServiceHash() =>
    r'ef222f04241b820e194bed15660d51273761fb84';

/// See also [localNotificationService].
@ProviderFor(localNotificationService)
final localNotificationServiceProvider =
    Provider<LocalNotificationService>.internal(
  localNotificationService,
  name: r'localNotificationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localNotificationServiceHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef LocalNotificationServiceRef = ProviderRef<LocalNotificationService>;
String _$firebaseMessagingServiceHash() =>
    r'4e5b566f5172ba188388e44839e74032357a7d81';

/// See also [firebaseMessagingService].
@ProviderFor(firebaseMessagingService)
final firebaseMessagingServiceProvider =
    Provider<FirebaseMessagingService>.internal(
  firebaseMessagingService,
  name: r'firebaseMessagingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseMessagingServiceHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef FirebaseMessagingServiceRef = ProviderRef<FirebaseMessagingService>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
