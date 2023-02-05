// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SymptomSearchResult {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SymptomSearchResultCopyWith<SymptomSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomSearchResultCopyWith<$Res> {
  factory $SymptomSearchResultCopyWith(
          SymptomSearchResult value, $Res Function(SymptomSearchResult) then) =
      _$SymptomSearchResultCopyWithImpl<$Res, SymptomSearchResult>;
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class _$SymptomSearchResultCopyWithImpl<$Res, $Val extends SymptomSearchResult>
    implements $SymptomSearchResultCopyWith<$Res> {
  _$SymptomSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SymptomSearchResultCopyWith<$Res>
    implements $SymptomSearchResultCopyWith<$Res> {
  factory _$$_SymptomSearchResultCopyWith(_$_SymptomSearchResult value,
          $Res Function(_$_SymptomSearchResult) then) =
      __$$_SymptomSearchResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class __$$_SymptomSearchResultCopyWithImpl<$Res>
    extends _$SymptomSearchResultCopyWithImpl<$Res, _$_SymptomSearchResult>
    implements _$$_SymptomSearchResultCopyWith<$Res> {
  __$$_SymptomSearchResultCopyWithImpl(_$_SymptomSearchResult _value,
      $Res Function(_$_SymptomSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_$_SymptomSearchResult(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SymptomSearchResult implements _SymptomSearchResult {
  const _$_SymptomSearchResult({required this.code, required this.description});

  @override
  final String code;
  @override
  final String description;

  @override
  String toString() {
    return 'SymptomSearchResult(code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomSearchResult &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomSearchResultCopyWith<_$_SymptomSearchResult> get copyWith =>
      __$$_SymptomSearchResultCopyWithImpl<_$_SymptomSearchResult>(
          this, _$identity);
}

abstract class _SymptomSearchResult implements SymptomSearchResult {
  const factory _SymptomSearchResult(
      {required final String code,
      required final String description}) = _$_SymptomSearchResult;

  @override
  String get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomSearchResultCopyWith<_$_SymptomSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}
