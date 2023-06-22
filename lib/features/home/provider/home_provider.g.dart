// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$greetingHash() => r'eac64e03f67988e1ee339309bd5d483142035aba';

/// See also [greeting].
@ProviderFor(greeting)
final greetingProvider = AutoDisposeProvider<String>.internal(
  greeting,
  name: r'greetingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$greetingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GreetingRef = AutoDisposeProviderRef<String>;
String _$userInitialsHash() => r'50458c5779581750801bfb67b14510d9b7fcccbc';

/// See also [userInitials].
@ProviderFor(userInitials)
final userInitialsProvider = AutoDisposeProvider<String>.internal(
  userInitials,
  name: r'userInitialsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userInitialsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserInitialsRef = AutoDisposeProviderRef<String>;
String _$selectedIndexHash() => r'001190b51b061f0742f6dddeff141593dde6d378';

/// See also [SelectedIndex].
@ProviderFor(SelectedIndex)
final selectedIndexProvider =
    AutoDisposeNotifierProvider<SelectedIndex, int>.internal(
  SelectedIndex.new,
  name: r'selectedIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedIndex = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
