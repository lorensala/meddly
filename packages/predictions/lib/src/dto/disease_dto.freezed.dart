// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseDto _$DiseaseDtoFromJson(Map<String, dynamic> json) {
  return _DiseaseDto.fromJson(json);
}

/// @nodoc
mixin _$DiseaseDto {
  String get disease => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseDtoCopyWith<DiseaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseDtoCopyWith<$Res> {
  factory $DiseaseDtoCopyWith(
          DiseaseDto value, $Res Function(DiseaseDto) then) =
      _$DiseaseDtoCopyWithImpl<$Res, DiseaseDto>;
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class _$DiseaseDtoCopyWithImpl<$Res, $Val extends DiseaseDto>
    implements $DiseaseDtoCopyWith<$Res> {
  _$DiseaseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? probability = null,
  }) {
    return _then(_value.copyWith(
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseDtoCopyWith<$Res>
    implements $DiseaseDtoCopyWith<$Res> {
  factory _$$_DiseaseDtoCopyWith(
          _$_DiseaseDto value, $Res Function(_$_DiseaseDto) then) =
      __$$_DiseaseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class __$$_DiseaseDtoCopyWithImpl<$Res>
    extends _$DiseaseDtoCopyWithImpl<$Res, _$_DiseaseDto>
    implements _$$_DiseaseDtoCopyWith<$Res> {
  __$$_DiseaseDtoCopyWithImpl(
      _$_DiseaseDto _value, $Res Function(_$_DiseaseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? probability = null,
  }) {
    return _then(_$_DiseaseDto(
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiseaseDto extends _DiseaseDto {
  const _$_DiseaseDto({required this.disease, required this.probability})
      : super._();

  factory _$_DiseaseDto.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseDtoFromJson(json);

  @override
  final String disease;
  @override
  final double probability;

  @override
  String toString() {
    return 'DiseaseDto(disease: $disease, probability: $probability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseDto &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, disease, probability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseDtoCopyWith<_$_DiseaseDto> get copyWith =>
      __$$_DiseaseDtoCopyWithImpl<_$_DiseaseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseDtoToJson(
      this,
    );
  }
}

abstract class _DiseaseDto extends DiseaseDto {
  const factory _DiseaseDto(
      {required final String disease,
      required final double probability}) = _$_DiseaseDto;
  const _DiseaseDto._() : super._();

  factory _DiseaseDto.fromJson(Map<String, dynamic> json) =
      _$_DiseaseDto.fromJson;

  @override
  String get disease;
  @override
  double get probability;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseDtoCopyWith<_$_DiseaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
