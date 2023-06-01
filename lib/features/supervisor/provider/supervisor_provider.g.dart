// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supervisorApiHash() => r'79b08e2a769601773a8625cdcda518ead6d7960e';

/// See also [supervisorApi].
@ProviderFor(supervisorApi)
final supervisorApiProvider = AutoDisposeProvider<SupervisorApi>.internal(
  supervisorApi,
  name: r'supervisorApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supervisorApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupervisorApiRef = AutoDisposeProviderRef<SupervisorApi>;
String _$supervisorRepositoryHash() =>
    r'8eac5322d8aef067f9c5cc7e9728991d629a178b';

/// See also [supervisorRepository].
@ProviderFor(supervisorRepository)
final supervisorRepositoryProvider =
    AutoDisposeProvider<SupervisorRepository>.internal(
  supervisorRepository,
  name: r'supervisorRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supervisorRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupervisorRepositoryRef = AutoDisposeProviderRef<SupervisorRepository>;
String _$supervisorHash() => r'bc1078b2675fb6dfa852108385c511458153f95b';

/// See also [supervisor].
@ProviderFor(supervisor)
final supervisorProvider = AutoDisposeProvider<User>.internal(
  supervisor,
  name: r'supervisorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supervisorHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef SupervisorRef = AutoDisposeProviderRef<User>;
String _$supervisedHash() => r'8996420a244fa1701b5d279b82b8f0ed77c12c41';

/// See also [supervised].
@ProviderFor(supervised)
final supervisedProvider = AutoDisposeProvider<User>.internal(
  supervised,
  name: r'supervisedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supervisedHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef SupervisedRef = AutoDisposeProviderRef<User>;
String _$selectedSupervisedHash() =>
    r'42f5e6e584448d6fa30c1d4dfdbc375842889150';

/// See also [SelectedSupervised].
@ProviderFor(SelectedSupervised)
final selectedSupervisedProvider =
    AutoDisposeNotifierProvider<SelectedSupervised, User?>.internal(
  SelectedSupervised.new,
  name: r'selectedSupervisedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSupervisedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedSupervised = AutoDisposeNotifier<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
