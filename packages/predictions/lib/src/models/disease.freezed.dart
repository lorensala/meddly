// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Disease {
  String get disease => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiseaseCopyWith<Disease> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseCopyWith<$Res> {
  factory $DiseaseCopyWith(Disease value, $Res Function(Disease) then) =
      _$DiseaseCopyWithImpl<$Res, Disease>;
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class _$DiseaseCopyWithImpl<$Res, $Val extends Disease>
    implements $DiseaseCopyWith<$Res> {
  _$DiseaseCopyWithImpl(this._value, this._then);

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
abstract class _$$_DiseaseCopyWith<$Res> implements $DiseaseCopyWith<$Res> {
  factory _$$_DiseaseCopyWith(
          _$_Disease value, $Res Function(_$_Disease) then) =
      __$$_DiseaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String disease, double probability});
}

/// @nodoc
class __$$_DiseaseCopyWithImpl<$Res>
    extends _$DiseaseCopyWithImpl<$Res, _$_Disease>
    implements _$$_DiseaseCopyWith<$Res> {
  __$$_DiseaseCopyWithImpl(_$_Disease _value, $Res Function(_$_Disease) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? probability = null,
  }) {
    return _then(_$_Disease(
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

class _$_Disease implements _Disease {
  const _$_Disease({required this.disease, required this.probability});

  @override
  final String disease;
  @override
  final double probability;

  @override
  String toString() {
    return 'Disease(disease: $disease, probability: $probability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disease &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @override
  int get hashCode => Object.hash(runtimeType, disease, probability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      __$$_DiseaseCopyWithImpl<_$_Disease>(this, _$identity);
}

abstract class _Disease implements Disease {
  const factory _Disease(
      {required final String disease,
      required final double probability}) = _$_Disease;

  @override
  String get disease;
  @override
  double get probability;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      throw _privateConstructorUsedError;
}
