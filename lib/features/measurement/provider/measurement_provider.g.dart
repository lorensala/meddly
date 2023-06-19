// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$measurementApiHash() => r'da53ab231832fc0bc71566293863a89dca46a0e6';

/// See also [measurementApi].
@ProviderFor(measurementApi)
final measurementApiProvider = AutoDisposeProvider<MeasurementApi>.internal(
  measurementApi,
  name: r'measurementApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$measurementApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MeasurementApiRef = AutoDisposeProviderRef<MeasurementApi>;
String _$measurementRepositoryHash() =>
    r'7d35afc9649e59cd2f74659448f1ff4cc5da05e2';

/// See also [measurementRepository].
@ProviderFor(measurementRepository)
final measurementRepositoryProvider =
    AutoDisposeProvider<MeasurementRepository>.internal(
  measurementRepository,
  name: r'measurementRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$measurementRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MeasurementRepositoryRef
    = AutoDisposeProviderRef<MeasurementRepository>;
String _$measurementIsValidHash() =>
    r'795804de055af03254723b47b931c828a7502d75';

/// See also [measurementIsValid].
@ProviderFor(measurementIsValid)
final measurementIsValidProvider = AutoDisposeProvider<bool>.internal(
  measurementIsValid,
  name: r'measurementIsValidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$measurementIsValidHash,
  dependencies: <ProviderOrFamily>[measurementFormControllerProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    measurementFormControllerProvider,
    ...?measurementFormControllerProvider.allTransitiveDependencies
  },
);

typedef MeasurementIsValidRef = AutoDisposeProviderRef<bool>;
String _$measurementHash() => r'd4cb536e1b39dcb74e7538389651f531f3e8e10f';

/// See also [measurement].
@ProviderFor(measurement)
final measurementProvider = AutoDisposeProvider<Measurement>.internal(
  measurement,
  name: r'measurementProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$measurementHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef MeasurementRef = AutoDisposeProviderRef<Measurement>;
String _$existingMeasurementHash() =>
    r'e126f6e29f6d557d320fd957ea0b2456f41c4950';

/// See also [existingMeasurement].
@ProviderFor(existingMeasurement)
final existingMeasurementProvider = AutoDisposeProvider<Measurement?>.internal(
  existingMeasurement,
  name: r'existingMeasurementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$existingMeasurementHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ExistingMeasurementRef = AutoDisposeProviderRef<Measurement?>;
String _$filteredMeasurementsHash() =>
    r'ac37caae76098da22d6cbea9ad5572dd4672b2fe';

/// See also [filteredMeasurements].
@ProviderFor(filteredMeasurements)
final filteredMeasurementsProvider =
    AutoDisposeProvider<List<Measurement>>.internal(
  filteredMeasurements,
  name: r'filteredMeasurementsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredMeasurementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredMeasurementsRef = AutoDisposeProviderRef<List<Measurement>>;
String _$measurementTypesHash() => r'ee6ee24358c247df58a6cb5bd1d42cb955578c39';

/// See also [MeasurementTypes].
@ProviderFor(MeasurementTypes)
final measurementTypesProvider = AutoDisposeNotifierProvider<MeasurementTypes,
    List<MeasurementType>>.internal(
  MeasurementTypes.new,
  name: r'measurementTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$measurementTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MeasurementTypes = AutoDisposeNotifier<List<MeasurementType>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
