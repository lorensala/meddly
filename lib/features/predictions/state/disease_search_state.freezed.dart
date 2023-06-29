// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiseaseSearchState {
  Name get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiseaseSearchStateCopyWith<DiseaseSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseSearchStateCopyWith<$Res> {
  factory $DiseaseSearchStateCopyWith(
          DiseaseSearchState value, $Res Function(DiseaseSearchState) then) =
      _$DiseaseSearchStateCopyWithImpl<$Res, DiseaseSearchState>;
  @useResult
  $Res call({Name query});
}

/// @nodoc
class _$DiseaseSearchStateCopyWithImpl<$Res, $Val extends DiseaseSearchState>
    implements $DiseaseSearchStateCopyWith<$Res> {
  _$DiseaseSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseSearchStateCopyWith<$Res>
    implements $DiseaseSearchStateCopyWith<$Res> {
  factory _$$_DiseaseSearchStateCopyWith(_$_DiseaseSearchState value,
          $Res Function(_$_DiseaseSearchState) then) =
      __$$_DiseaseSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Name query});
}

/// @nodoc
class __$$_DiseaseSearchStateCopyWithImpl<$Res>
    extends _$DiseaseSearchStateCopyWithImpl<$Res, _$_DiseaseSearchState>
    implements _$$_DiseaseSearchStateCopyWith<$Res> {
  __$$_DiseaseSearchStateCopyWithImpl(
      _$_DiseaseSearchState _value, $Res Function(_$_DiseaseSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_DiseaseSearchState(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Name,
    ));
  }
}

/// @nodoc

class _$_DiseaseSearchState extends _DiseaseSearchState {
  const _$_DiseaseSearchState({this.query = const Name.pure()}) : super._();

  @override
  @JsonKey()
  final Name query;

  @override
  String toString() {
    return 'DiseaseSearchState(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseSearchState &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseSearchStateCopyWith<_$_DiseaseSearchState> get copyWith =>
      __$$_DiseaseSearchStateCopyWithImpl<_$_DiseaseSearchState>(
          this, _$identity);
}

abstract class _DiseaseSearchState extends DiseaseSearchState {
  const factory _DiseaseSearchState({final Name query}) = _$_DiseaseSearchState;
  const _DiseaseSearchState._() : super._();

  @override
  Name get query;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseSearchStateCopyWith<_$_DiseaseSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
