// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisor_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supervisorControllerHash() =>
    r'4cb1d10b25aeaa44a9764c70f25d227216a180f6';

/// See also [SupervisorController].
@ProviderFor(SupervisorController)
final supervisorControllerProvider = AutoDisposeAsyncNotifierProvider<
    SupervisorController,
    ({List<User> supervised, List<User> supervisors})>.internal(
  SupervisorController.new,
  name: r'supervisorControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supervisorControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SupervisorController = AutoDisposeAsyncNotifier<
    ({List<User> supervised, List<User> supervisors})>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions