// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SymptomSearchState {
  Name get query => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  List<SymptomSearchResult> get results => throw _privateConstructorUsedError;
  PredictionFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SymptomSearchStateCopyWith<SymptomSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomSearchStateCopyWith<$Res> {
  factory $SymptomSearchStateCopyWith(
          SymptomSearchState value, $Res Function(SymptomSearchState) then) =
      _$SymptomSearchStateCopyWithImpl<$Res, SymptomSearchState>;
  @useResult
  $Res call(
      {Name query,
      FormzStatus status,
      List<SymptomSearchResult> results,
      PredictionFailure? failure});

  $PredictionFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$SymptomSearchStateCopyWithImpl<$Res, $Val extends SymptomSearchState>
    implements $SymptomSearchStateCopyWith<$Res> {
  _$SymptomSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? results = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SymptomSearchResult>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PredictionFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PredictionFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $PredictionFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SymptomSearchStateCopyWith<$Res>
    implements $SymptomSearchStateCopyWith<$Res> {
  factory _$$_SymptomSearchStateCopyWith(_$_SymptomSearchState value,
          $Res Function(_$_SymptomSearchState) then) =
      __$$_SymptomSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name query,
      FormzStatus status,
      List<SymptomSearchResult> results,
      PredictionFailure? failure});

  @override
  $PredictionFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$_SymptomSearchStateCopyWithImpl<$Res>
    extends _$SymptomSearchStateCopyWithImpl<$Res, _$_SymptomSearchState>
    implements _$$_SymptomSearchStateCopyWith<$Res> {
  __$$_SymptomSearchStateCopyWithImpl(
      _$_SymptomSearchState _value, $Res Function(_$_SymptomSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? results = null,
    Object? failure = freezed,
  }) {
    return _then(_$_SymptomSearchState(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SymptomSearchResult>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PredictionFailure?,
    ));
  }
}

/// @nodoc

class _$_SymptomSearchState implements _SymptomSearchState {
  const _$_SymptomSearchState(
      {this.query = const Name.pure(),
      this.status = FormzStatus.pure,
      final List<SymptomSearchResult> results = const <SymptomSearchResult>[],
      this.failure})
      : _results = results;

  @override
  @JsonKey()
  final Name query;
  @override
  @JsonKey()
  final FormzStatus status;
  final List<SymptomSearchResult> _results;
  @override
  @JsonKey()
  List<SymptomSearchResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final PredictionFailure? failure;

  @override
  String toString() {
    return 'SymptomSearchState(query: $query, status: $status, results: $results, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomSearchState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, status,
      const DeepCollectionEquality().hash(_results), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomSearchStateCopyWith<_$_SymptomSearchState> get copyWith =>
      __$$_SymptomSearchStateCopyWithImpl<_$_SymptomSearchState>(
          this, _$identity);
}

abstract class _SymptomSearchState implements SymptomSearchState {
  const factory _SymptomSearchState(
      {final Name query,
      final FormzStatus status,
      final List<SymptomSearchResult> results,
      final PredictionFailure? failure}) = _$_SymptomSearchState;

  @override
  Name get query;
  @override
  FormzStatus get status;
  @override
  List<SymptomSearchResult> get results;
  @override
  PredictionFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomSearchStateCopyWith<_$_SymptomSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
