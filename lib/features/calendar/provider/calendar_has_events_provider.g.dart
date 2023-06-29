// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_has_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarHasEventsHash() => r'7d91c4b427440eeb0ed7a11f9c5659f366a0a326';

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

typedef CalendarHasEventsRef = AutoDisposeProviderRef<bool>;

/// See also [calendarHasEvents].
@ProviderFor(calendarHasEvents)
const calendarHasEventsProvider = CalendarHasEventsFamily();

/// See also [calendarHasEvents].
class CalendarHasEventsFamily extends Family<bool> {
  /// See also [calendarHasEvents].
  const CalendarHasEventsFamily();

  /// See also [calendarHasEvents].
  CalendarHasEventsProvider call({
    required DateTime date,
  }) {
    return CalendarHasEventsProvider(
      date: date,
    );
  }

  @override
  CalendarHasEventsProvider getProviderOverride(
    covariant CalendarHasEventsProvider provider,
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
  String? get name => r'calendarHasEventsProvider';
}

/// See also [calendarHasEvents].
class CalendarHasEventsProvider extends AutoDisposeProvider<bool> {
  /// See also [calendarHasEvents].
  CalendarHasEventsProvider({
    required this.date,
  }) : super.internal(
          (ref) => calendarHasEvents(
            ref,
            date: date,
          ),
          from: calendarHasEventsProvider,
          name: r'calendarHasEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarHasEventsHash,
          dependencies: CalendarHasEventsFamily._dependencies,
          allTransitiveDependencies:
              CalendarHasEventsFamily._allTransitiveDependencies,
        );

  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is CalendarHasEventsProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
