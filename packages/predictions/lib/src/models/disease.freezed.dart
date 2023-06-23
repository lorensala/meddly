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

Disease _$DiseaseFromJson(Map<String, dynamic> json) {
  return _Disease.fromJson(json);
}

/// @nodoc
mixin _$Disease {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseCopyWith<Disease> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseCopyWith<$Res> {
  factory $DiseaseCopyWith(Disease value, $Res Function(Disease) then) =
      _$DiseaseCopyWithImpl<$Res, Disease>;
  @useResult
  $Res call({String code, String description});
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
abstract class _$$_DiseaseCopyWith<$Res> implements $DiseaseCopyWith<$Res> {
  factory _$$_DiseaseCopyWith(
          _$_Disease value, $Res Function(_$_Disease) then) =
      __$$_DiseaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String description});
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
    Object? code = null,
    Object? description = null,
  }) {
    return _then(_$_Disease(
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
class _$_Disease implements _Disease {
  const _$_Disease({required this.code, required this.description});

  factory _$_Disease.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseFromJson(json);

  @override
  final String code;
  @override
  final String description;

  @override
  String toString() {
    return 'Disease(code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disease &&
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
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      __$$_DiseaseCopyWithImpl<_$_Disease>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseToJson(
      this,
    );
  }
}

abstract class _Disease implements Disease {
  const factory _Disease(
      {required final String code,
      required final String description}) = _$_Disease;

  factory _Disease.fromJson(Map<String, dynamic> json) = _$_Disease.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      throw _privateConstructorUsedError;
}
