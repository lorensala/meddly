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
  int get id => throw _privateConstructorUsedError;
  List<Disease> get prediction => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;

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
  $Res call(
      {int id, List<Disease> prediction, bool verified, List<String> symptoms});
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
              as List<Disease>,
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
abstract class _$$_PredictionCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$_PredictionCopyWith(
          _$_Prediction value, $Res Function(_$_Prediction) then) =
      __$$_PredictionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, List<Disease> prediction, bool verified, List<String> symptoms});
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
    Object? id = null,
    Object? prediction = null,
    Object? verified = null,
    Object? symptoms = null,
  }) {
    return _then(_$_Prediction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value._prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<Disease>,
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
class _$_Prediction implements _Prediction {
  const _$_Prediction(
      {required this.id,
      required final List<Disease> prediction,
      required this.verified,
      required final List<String> symptoms})
      : _prediction = prediction,
        _symptoms = symptoms;

  factory _$_Prediction.fromJson(Map<String, dynamic> json) =>
      _$$_PredictionFromJson(json);

  @override
  final int id;
  final List<Disease> _prediction;
  @override
  List<Disease> get prediction {
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
    return 'Prediction(id: $id, prediction: $prediction, verified: $verified, symptoms: $symptoms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prediction &&
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
      {required final int id,
      required final List<Disease> prediction,
      required final bool verified,
      required final List<String> symptoms}) = _$_Prediction;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$_Prediction.fromJson;

  @override
  int get id;
  @override
  List<Disease> get prediction;
  @override
  bool get verified;
  @override
  List<String> get symptoms;
  @override
  @JsonKey(ignore: true)
  _$$_PredictionCopyWith<_$_Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}
