// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarControllerHash() =>
    r'f1a2abda0c3fbc6828d843847d648a3c0eb6ceb6';

/// See also [CalendarController].
@ProviderFor(CalendarController)
final calendarControllerProvider = AsyncNotifierProvider<
    CalendarController,
    ({
      List<Appointment> appointments,
      List<Consumption> consumptions,
      List<Measurement> measurements
    })>.internal(
  CalendarController.new,
  name: r'calendarControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarController = AsyncNotifier<
    ({
      List<Appointment> appointments,
      List<Consumption> consumptions,
      List<Measurement> measurements
    })>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
