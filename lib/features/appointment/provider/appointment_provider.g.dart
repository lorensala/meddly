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
String _$existingAppointmentHash() =>
    r'e9d2d474336d8d443356d7a431317869bfe17b8a';

/// See also [existingAppointment].
@ProviderFor(existingAppointment)
final existingAppointmentProvider = AutoDisposeProvider<Appointment?>.internal(
  existingAppointment,
  name: r'existingAppointmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$existingAppointmentHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ExistingAppointmentRef = AutoDisposeProviderRef<Appointment?>;
String _$isAppointmentValidHash() =>
    r'63ea4401a3415a3a7dabf8943ea6afba4d88269a';

/// See also [isAppointmentValid].
@ProviderFor(isAppointmentValid)
final isAppointmentValidProvider = AutoDisposeProvider<bool>.internal(
  isAppointmentValid,
  name: r'isAppointmentValidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAppointmentValidHash,
  dependencies: <ProviderOrFamily>[appointmentFormControllerProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    appointmentFormControllerProvider,
    ...?appointmentFormControllerProvider.allTransitiveDependencies
  },
);

typedef IsAppointmentValidRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
