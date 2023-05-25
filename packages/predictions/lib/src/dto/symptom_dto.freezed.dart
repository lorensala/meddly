// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomDto _$SymptomDtoFromJson(Map<String, dynamic> json) {
  return _SymptomDto.fromJson(json);
}

/// @nodoc
mixin _$SymptomDto {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomDtoCopyWith<SymptomDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomDtoCopyWith<$Res> {
  factory $SymptomDtoCopyWith(
          SymptomDto value, $Res Function(SymptomDto) then) =
      _$SymptomDtoCopyWithImpl<$Res, SymptomDto>;
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class _$SymptomDtoCopyWithImpl<$Res, $Val extends SymptomDto>
    implements $SymptomDtoCopyWith<$Res> {
  _$SymptomDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_SymptomDtoCopyWith<$Res>
    implements $SymptomDtoCopyWith<$Res> {
  factory _$$_SymptomDtoCopyWith(
          _$_SymptomDto value, $Res Function(_$_SymptomDto) then) =
      __$$_SymptomDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String description});
}

/// @nodoc
class __$$_SymptomDtoCopyWithImpl<$Res>
    extends _$SymptomDtoCopyWithImpl<$Res, _$_SymptomDto>
    implements _$$_SymptomDtoCopyWith<$Res> {
  __$$_SymptomDtoCopyWithImpl(
      _$_SymptomDto _value, $Res Function(_$_SymptomDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_$_SymptomDto(
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
class _$_SymptomDto extends _SymptomDto {
  const _$_SymptomDto({required this.code, required this.description})
      : super._();

  factory _$_SymptomDto.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomDtoFromJson(json);

  @override
  final String code;
  @override
  final String description;

  @override
  String toString() {
    return 'SymptomDto(code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomDto &&
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
  _$$_SymptomDtoCopyWith<_$_SymptomDto> get copyWith =>
      __$$_SymptomDtoCopyWithImpl<_$_SymptomDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomDtoToJson(
      this,
    );
  }
}

abstract class _SymptomDto extends SymptomDto {
  const factory _SymptomDto(
      {required final String code,
      required final String description}) = _$_SymptomDto;
  const _SymptomDto._() : super._();

  factory _SymptomDto.fromJson(Map<String, dynamic> json) =
      _$_SymptomDto.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomDtoCopyWith<_$_SymptomDto> get copyWith =>
      throw _privateConstructorUsedError;
}
