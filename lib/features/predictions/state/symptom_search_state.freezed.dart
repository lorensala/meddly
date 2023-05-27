// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SymptomSearchState {
  Name get query => throw _privateConstructorUsedError;
  List<Symptom> get results => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;

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
  $Res call({Name query, List<Symptom> results, FormzSubmissionStatus status});
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
    Object? results = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ) as $Val);
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
  $Res call({Name query, List<Symptom> results, FormzSubmissionStatus status});
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
    Object? results = null,
    Object? status = null,
  }) {
    return _then(_$_SymptomSearchState(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_SymptomSearchState extends _SymptomSearchState {
  const _$_SymptomSearchState(
      {this.query = const Name.pure(),
      final List<Symptom> results = const <Symptom>[],
      this.status = FormzSubmissionStatus.initial})
      : _results = results,
        super._();

  @override
  @JsonKey()
  final Name query;
  final List<Symptom> _results;
  @override
  @JsonKey()
  List<Symptom> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final FormzSubmissionStatus status;

  @override
  String toString() {
    return 'SymptomSearchState(query: $query, results: $results, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomSearchState &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query,
      const DeepCollectionEquality().hash(_results), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomSearchStateCopyWith<_$_SymptomSearchState> get copyWith =>
      __$$_SymptomSearchStateCopyWithImpl<_$_SymptomSearchState>(
          this, _$identity);
}

abstract class _SymptomSearchState extends SymptomSearchState {
  const factory _SymptomSearchState(
      {final Name query,
      final List<Symptom> results,
      final FormzSubmissionStatus status}) = _$_SymptomSearchState;
  const _SymptomSearchState._() : super._();

  @override
  Name get query;
  @override
  List<Symptom> get results;
  @override
  FormzSubmissionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomSearchStateCopyWith<_$_SymptomSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
