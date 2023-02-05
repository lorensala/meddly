// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_search_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomSearchResultDto _$SymptomSearchResultDtoFromJson(
    Map<String, dynamic> json) {
  return _SymptomSearchResultDto.fromJson(json);
}

/// @nodoc
mixin _$SymptomSearchResultDto {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomSearchResultDtoCopyWith<SymptomSearchResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomSearchResultDtoCopyWith<$Res> {
  factory $SymptomSearchResultDtoCopyWith(SymptomSearchResultDto value,
          $Res Function(SymptomSearchResultDto) then) =
      _$SymptomSearchResultDtoCopyWithImpl<$Res, SymptomSearchResultDto>;
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class _$SymptomSearchResultDtoCopyWithImpl<$Res,
        $Val extends SymptomSearchResultDto>
    implements $SymptomSearchResultDtoCopyWith<$Res> {
  _$SymptomSearchResultDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_SymptomSearchResultDtoCopyWith<$Res>
    implements $SymptomSearchResultDtoCopyWith<$Res> {
  factory _$$_SymptomSearchResultDtoCopyWith(_$_SymptomSearchResultDto value,
          $Res Function(_$_SymptomSearchResultDto) then) =
      __$$_SymptomSearchResultDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class __$$_SymptomSearchResultDtoCopyWithImpl<$Res>
    extends _$SymptomSearchResultDtoCopyWithImpl<$Res,
        _$_SymptomSearchResultDto>
    implements _$$_SymptomSearchResultDtoCopyWith<$Res> {
  __$$_SymptomSearchResultDtoCopyWithImpl(_$_SymptomSearchResultDto _value,
      $Res Function(_$_SymptomSearchResultDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_$_SymptomSearchResultDto(
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
@JsonSerializable()
class _$_SymptomSearchResultDto extends _SymptomSearchResultDto {
  const _$_SymptomSearchResultDto(
      {required this.code, required this.description})
      : super._();

  factory _$_SymptomSearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomSearchResultDtoFromJson(json);

  @override
  final String code;
  @override
  final String description;

  @override
  String toString() {
    return 'SymptomSearchResultDto(code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomSearchResultDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomSearchResultDtoCopyWith<_$_SymptomSearchResultDto> get copyWith =>
      __$$_SymptomSearchResultDtoCopyWithImpl<_$_SymptomSearchResultDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomSearchResultDtoToJson(
      this,
    );
  }
}

abstract class _SymptomSearchResultDto extends SymptomSearchResultDto {
  const factory _SymptomSearchResultDto(
      {required final String code,
      required final String description}) = _$_SymptomSearchResultDto;
  const _SymptomSearchResultDto._() : super._();

  factory _SymptomSearchResultDto.fromJson(Map<String, dynamic> json) =
      _$_SymptomSearchResultDto.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomSearchResultDtoCopyWith<_$_SymptomSearchResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
