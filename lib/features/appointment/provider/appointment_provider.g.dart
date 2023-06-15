// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentApiHash() => r'ba90db36926c4a568c18e10deba0d004736ce07e';

/// See also [appointmentApi].
@ProviderFor(appointmentApi)
final appointmentApiProvider = AutoDisposeProvider<AppointmentApi>.internal(
  appointmentApi,
  name: r'appointmentApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppointmentApiRef = AutoDisposeProviderRef<AppointmentApi>;
String _$appointmentRepositoryHash() =>
    r'07ccf2f0e55b43f07949e79e34bf6195d61e45ea';

/// See also [appointmentRepository].
@ProviderFor(appointmentRepository)
final appointmentRepositoryProvider =
    AutoDisposeProvider<AppointmentRepository>.internal(
  appointmentRepository,
  name: r'appointmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppointmentRepositoryRef
    = AutoDisposeProviderRef<AppointmentRepository>;
String _$appointmentHash() => r'6057663c40792ce458d2229a68c288b10f043013';

/// See also [appointment].
@ProviderFor(appointment)
final appointmentProvider = AutoDisposeProvider<Appointment>.internal(
  appointment,
  name: r'appointmentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appointmentHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef AppointmentRef = AutoDisposeProviderRef<Appointment>;
String _$isAppointmentFormValidHash() =>
    r'8c2b0b76e5df0a9117c63ee569cd837dd8f5e199';

/// See also [isAppointmentFormValid].
@ProviderFor(isAppointmentFormValid)
final isAppointmentFormValidProvider = AutoDisposeProvider<bool>.internal(
  isAppointmentFormValid,
  name: r'isAppointmentFormValidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAppointmentFormValidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAppointmentFormValidRef = AutoDisposeProviderRef<bool>;
String _$loadExistingAppointmentHash() =>
    r'9a7157c9d171171e30f2748225cd88427be05a84';

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

typedef LoadExistingAppointmentRef = AutoDisposeProviderRef<void>;

/// See also [loadExistingAppointment].
@ProviderFor(loadExistingAppointment)
const loadExistingAppointmentProvider = LoadExistingAppointmentFamily();

/// See also [loadExistingAppointment].
class LoadExistingAppointmentFamily extends Family<void> {
  /// See also [loadExistingAppointment].
  const LoadExistingAppointmentFamily();

  /// See also [loadExistingAppointment].
  LoadExistingAppointmentProvider call({
    int? id,
  }) {
    return LoadExistingAppointmentProvider(
      id: id,
    );
  }

  @override
  LoadExistingAppointmentProvider getProviderOverride(
    covariant LoadExistingAppointmentProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'loadExistingAppointmentProvider';
}

/// See also [loadExistingAppointment].
class LoadExistingAppointmentProvider extends AutoDisposeProvider<void> {
  /// See also [loadExistingAppointment].
  LoadExistingAppointmentProvider({
    this.id,
  }) : super.internal(
          (ref) => loadExistingAppointment(
            ref,
            id: id,
          ),
          from: loadExistingAppointmentProvider,
          name: r'loadExistingAppointmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadExistingAppointmentHash,
          dependencies: LoadExistingAppointmentFamily._dependencies,
          allTransitiveDependencies:
              LoadExistingAppointmentFamily._allTransitiveDependencies,
        );

  final int? id;

  @override
  bool operator ==(Object other) {
    return other is LoadExistingAppointmentProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
