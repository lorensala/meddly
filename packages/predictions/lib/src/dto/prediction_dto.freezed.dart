// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PredictionDto _$PredictionDtoFromJson(Map<String, dynamic> json) {
  return _PredictionDto.fromJson(json);
}

/// @nodoc
mixin _$PredictionDto {
  int get id => throw _privateConstructorUsedError;
  List<DiseaseDto> get prediction => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionDtoCopyWith<PredictionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionDtoCopyWith<$Res> {
  factory $PredictionDtoCopyWith(
          PredictionDto value, $Res Function(PredictionDto) then) =
      _$PredictionDtoCopyWithImpl<$Res, PredictionDto>;
  @useResult
  $Res call(
      {int id,
      List<DiseaseDto> prediction,
      bool verified,
      List<String> symptoms});
}

/// @nodoc
class _$PredictionDtoCopyWithImpl<$Res, $Val extends PredictionDto>
    implements $PredictionDtoCopyWith<$Res> {
  _$PredictionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prediction = null,
    Object? verified = null,
    Object? symptoms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<DiseaseDto>,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PredictionDtoCopyWith<$Res>
    implements $PredictionDtoCopyWith<$Res> {
  factory _$$_PredictionDtoCopyWith(
          _$_PredictionDto value, $Res Function(_$_PredictionDto) then) =
      __$$_PredictionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<DiseaseDto> prediction,
      bool verified,
      List<String> symptoms});
}

/// @nodoc
class __$$_PredictionDtoCopyWithImpl<$Res>
    extends _$PredictionDtoCopyWithImpl<$Res, _$_PredictionDto>
    implements _$$_PredictionDtoCopyWith<$Res> {
  __$$_PredictionDtoCopyWithImpl(
      _$_PredictionDto _value, $Res Function(_$_PredictionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prediction = null,
    Object? verified = null,
    Object? symptoms = null,
  }) {
    return _then(_$_PredictionDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value._prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<DiseaseDto>,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PredictionDto extends _PredictionDto {
  const _$_PredictionDto(
      {required this.id,
      required final List<DiseaseDto> prediction,
      required this.verified,
      required final List<String> symptoms})
      : _prediction = prediction,
        _symptoms = symptoms,
        super._();

  factory _$_PredictionDto.fromJson(Map<String, dynamic> json) =>
      _$$_PredictionDtoFromJson(json);

  @override
  final int id;
  final List<DiseaseDto> _prediction;
  @override
  List<DiseaseDto> get prediction {
    if (_prediction is EqualUnmodifiableListView) return _prediction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prediction);
  }

  @override
  final bool verified;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  String toString() {
    return 'PredictionDto(id: $id, prediction: $prediction, verified: $verified, symptoms: $symptoms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PredictionDto &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._prediction, _prediction) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_prediction),
      verified,
      const DeepCollectionEquality().hash(_symptoms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PredictionDtoCopyWith<_$_PredictionDto> get copyWith =>
      __$$_PredictionDtoCopyWithImpl<_$_PredictionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PredictionDtoToJson(
      this,
    );
  }
}

abstract class _PredictionDto extends PredictionDto {
  const factory _PredictionDto(
      {required final int id,
      required final List<DiseaseDto> prediction,
      required final bool verified,
      required final List<String> symptoms}) = _$_PredictionDto;
  const _PredictionDto._() : super._();

  factory _PredictionDto.fromJson(Map<String, dynamic> json) =
      _$_PredictionDto.fromJson;

  @override
  int get id;
  @override
  List<DiseaseDto> get prediction;
  @override
  bool get verified;
  @override
  List<String> get symptoms;
  @override
  @JsonKey(ignore: true)
  _$$_PredictionDtoCopyWith<_$_PredictionDto> get copyWith =>
      throw _privateConstructorUsedError;
}
