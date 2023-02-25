// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarCacheHash() => r'78e623989ee318097b13d69a164a46d37e5b5419';

/// See also [calendarCache].
@ProviderFor(calendarCache)
final calendarCacheProvider = AutoDisposeProvider<CalendarCache>.internal(
  calendarCache,
  name: r'calendarCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarCacheRef = AutoDisposeProviderRef<CalendarCache>;
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
    r'26899cf5204433699e3a9fbd86daa95c5e7b1eee';

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
String _$calendarEventsHash() => r'eb600f4ab2a3ceb61ca9f9910fcdb133d65a893f';

/// See also [calendarEvents].
@ProviderFor(calendarEvents)
final calendarEventsProvider = AutoDisposeProvider<List<Event>>.internal(
  calendarEvents,
  name: r'calendarEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarEventsRef = AutoDisposeProviderRef<List<Event>>;
String _$hasConsumedConsumptionHash() =>
    r'6df153b2ba6a46e6efd3e73e7d43e80f63671ce4';

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

typedef HasConsumedConsumptionRef = AutoDisposeProviderRef<bool>;

/// See also [hasConsumedConsumption].
@ProviderFor(hasConsumedConsumption)
const hasConsumedConsumptionProvider = HasConsumedConsumptionFamily();

/// See also [hasConsumedConsumption].
class HasConsumedConsumptionFamily extends Family<bool> {
  /// See also [hasConsumedConsumption].
  const HasConsumedConsumptionFamily();

  /// See also [hasConsumedConsumption].
  HasConsumedConsumptionProvider call({
    required DateTime date,
  }) {
    return HasConsumedConsumptionProvider(
      date: date,
    );
  }

  @override
  HasConsumedConsumptionProvider getProviderOverride(
    covariant HasConsumedConsumptionProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'hasConsumedConsumptionProvider';
}

/// See also [hasConsumedConsumption].
class HasConsumedConsumptionProvider extends AutoDisposeProvider<bool> {
  /// See also [hasConsumedConsumption].
  HasConsumedConsumptionProvider({
    required this.date,
  }) : super.internal(
          (ref) => hasConsumedConsumption(
            ref,
            date: date,
          ),
          from: hasConsumedConsumptionProvider,
          name: r'hasConsumedConsumptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hasConsumedConsumptionHash,
          dependencies: HasConsumedConsumptionFamily._dependencies,
          allTransitiveDependencies:
              HasConsumedConsumptionFamily._allTransitiveDependencies,
        );

  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is HasConsumedConsumptionProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
