// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_has_all_consumed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarHasAllConsumedHash() =>
    r'4f2fd78ac2d0ed63442a9c6b82d75f1ce728094e';

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

typedef CalendarHasAllConsumedRef = AutoDisposeProviderRef<bool>;

/// See also [calendarHasAllConsumed].
@ProviderFor(calendarHasAllConsumed)
const calendarHasAllConsumedProvider = CalendarHasAllConsumedFamily();

/// See also [calendarHasAllConsumed].
class CalendarHasAllConsumedFamily extends Family<bool> {
  /// See also [calendarHasAllConsumed].
  const CalendarHasAllConsumedFamily();

  /// See also [calendarHasAllConsumed].
  CalendarHasAllConsumedProvider call({
    required DateTime date,
  }) {
    return CalendarHasAllConsumedProvider(
      date: date,
    );
  }

  @override
  CalendarHasAllConsumedProvider getProviderOverride(
    covariant CalendarHasAllConsumedProvider provider,
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
  String? get name => r'calendarHasAllConsumedProvider';
}

/// See also [calendarHasAllConsumed].
class CalendarHasAllConsumedProvider extends AutoDisposeProvider<bool> {
  /// See also [calendarHasAllConsumed].
  CalendarHasAllConsumedProvider({
    required this.date,
  }) : super.internal(
          (ref) => calendarHasAllConsumed(
            ref,
            date: date,
          ),
          from: calendarHasAllConsumedProvider,
          name: r'calendarHasAllConsumedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarHasAllConsumedHash,
          dependencies: CalendarHasAllConsumedFamily._dependencies,
          allTransitiveDependencies:
              CalendarHasAllConsumedFamily._allTransitiveDependencies,
        );

  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is CalendarHasAllConsumedProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
