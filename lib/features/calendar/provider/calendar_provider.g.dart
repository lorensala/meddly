// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarApiHash() => r'7a8fe86e25cca00872fb557b97eb2e927b25e896';

/// See also [calendarApi].
@ProviderFor(calendarApi)
final calendarApiProvider = AutoDisposeProvider<CalendarApi>.internal(
  calendarApi,
  name: r'calendarApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$calendarApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarApiRef = AutoDisposeProviderRef<CalendarApi>;
String _$calendarRepositoryHash() =>
    r'5ee9007acd04fba8be324b7806f8243001352fb8';

/// See also [calendarRepository].
@ProviderFor(calendarRepository)
final calendarRepositoryProvider =
    AutoDisposeProvider<CalendarRepository>.internal(
  calendarRepository,
  name: r'calendarRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarRepositoryRef = AutoDisposeProviderRef<CalendarRepository>;
String _$allDaysOfYearHash() => r'695aaf540d709673b8bcfc8624f36e08a2494efd';

/// See also [allDaysOfYear].
@ProviderFor(allDaysOfYear)
final allDaysOfYearProvider = AutoDisposeProvider<List<DateTime>>.internal(
  allDaysOfYear,
  name: r'allDaysOfYearProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allDaysOfYearHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllDaysOfYearRef = AutoDisposeProviderRef<List<DateTime>>;
String _$eventHash() => r'df3b8fbcb08d41d65d7b14b51ea01d7bcd876148';

/// See also [event].
@ProviderFor(event)
final eventProvider = AutoDisposeProvider<CalendarEvent>.internal(
  event,
  name: r'eventProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$eventHash,
  dependencies: <ProviderOrFamily>[],
  allTransitiveDependencies: <ProviderOrFamily>[],
);

typedef EventRef = AutoDisposeProviderRef<CalendarEvent>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
