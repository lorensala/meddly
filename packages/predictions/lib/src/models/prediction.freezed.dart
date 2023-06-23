// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return _Prediction.fromJson(json);
}

/// @nodoc
mixin _$Prediction {
  String get disease => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionCopyWith<Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionCopyWith<$Res> {
  factory $PredictionCopyWith(
          Prediction value, $Res Function(Prediction) then) =
      _$PredictionCopyWithImpl<$Res, Prediction>;
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class _$PredictionCopyWithImpl<$Res, $Val extends Prediction>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._value, this._then);

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
abstract class _$$_PredictionCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$_PredictionCopyWith(
          _$_Prediction value, $Res Function(_$_Prediction) then) =
      __$$_PredictionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class __$$_PredictionCopyWithImpl<$Res>
    extends _$PredictionCopyWithImpl<$Res, _$_Prediction>
    implements _$$_PredictionCopyWith<$Res> {
  __$$_PredictionCopyWithImpl(
      _$_Prediction _value, $Res Function(_$_Prediction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? probability = null,
  }) {
    return _then(_$_Prediction(
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
class _$_Prediction implements _Prediction {
  const _$_Prediction({required this.disease, required this.probability});

  factory _$_Prediction.fromJson(Map<String, dynamic> json) =>
      _$$_PredictionFromJson(json);

  @override
  final String disease;
  @override
  final double probability;

  @override
  String toString() {
    return 'Prediction(disease: $disease, probability: $probability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prediction &&
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
  _$$_PredictionCopyWith<_$_Prediction> get copyWith =>
      __$$_PredictionCopyWithImpl<_$_Prediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PredictionToJson(
      this,
    );
  }
}

abstract class _Prediction implements Prediction {
  const factory _Prediction(
      {required final String disease,
      required final double probability}) = _$_Prediction;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$_Prediction.fromJson;

  @override
  String get disease;
  @override
  double get probability;
  @override
  @JsonKey(ignore: true)
  _$$_PredictionCopyWith<_$_Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}
