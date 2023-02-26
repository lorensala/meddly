// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$phoneNumberHash() => r'4e24234b21b1ab92f845106f9473ead1e041ca82';

/// See also [phoneNumber].
@ProviderFor(phoneNumber)
final phoneNumberProvider = AutoDisposeProvider<PhoneNumber>.internal(
  phoneNumber,
  name: r'phoneNumberProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$phoneNumberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhoneNumberRef = AutoDisposeProviderRef<PhoneNumber>;
String _$countryCodeHash() => r'b0e856341503db5251b9a5726a2f59750fd3e5ff';

/// See also [countryCode].
@ProviderFor(countryCode)
final countryCodeProvider = AutoDisposeProvider<CountryCode>.internal(
  countryCode,
  name: r'countryCodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countryCodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountryCodeRef = AutoDisposeProviderRef<CountryCode>;
String _$isPhoneNumberValidHash() =>
    r'2d5e9faed92d82547eb929168939896bfe00ebb7';

/// See also [isPhoneNumberValid].
@ProviderFor(isPhoneNumberValid)
final isPhoneNumberValidProvider = AutoDisposeProvider<bool>.internal(
  isPhoneNumberValid,
  name: r'isPhoneNumberValidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isPhoneNumberValidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsPhoneNumberValidRef = AutoDisposeProviderRef<bool>;
String _$phoneNumberErrorTextHash() =>
    r'e08c5a5e3b18521234299741fe1b359cf5fe6f7a';

/// See also [phoneNumberErrorText].
@ProviderFor(phoneNumberErrorText)
final phoneNumberErrorTextProvider = AutoDisposeProvider<String?>.internal(
  phoneNumberErrorText,
  name: r'phoneNumberErrorTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$phoneNumberErrorTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PhoneNumberErrorTextRef = AutoDisposeProviderRef<String?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
