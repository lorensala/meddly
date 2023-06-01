// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supervisor_code_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SupervisorCodeFormState {
  InvitationCode get invitationCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupervisorCodeFormStateCopyWith<SupervisorCodeFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupervisorCodeFormStateCopyWith<$Res> {
  factory $SupervisorCodeFormStateCopyWith(SupervisorCodeFormState value,
          $Res Function(SupervisorCodeFormState) then) =
      _$SupervisorCodeFormStateCopyWithImpl<$Res, SupervisorCodeFormState>;
  @useResult
  $Res call({InvitationCode invitationCode});
}

/// @nodoc
class _$SupervisorCodeFormStateCopyWithImpl<$Res,
        $Val extends SupervisorCodeFormState>
    implements $SupervisorCodeFormStateCopyWith<$Res> {
  _$SupervisorCodeFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
  }) {
    return _then(_value.copyWith(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupervisorCodeFormStateCopyWith<$Res>
    implements $SupervisorCodeFormStateCopyWith<$Res> {
  factory _$$_SupervisorCodeFormStateCopyWith(_$_SupervisorCodeFormState value,
          $Res Function(_$_SupervisorCodeFormState) then) =
      __$$_SupervisorCodeFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InvitationCode invitationCode});
}

/// @nodoc
class __$$_SupervisorCodeFormStateCopyWithImpl<$Res>
    extends _$SupervisorCodeFormStateCopyWithImpl<$Res,
        _$_SupervisorCodeFormState>
    implements _$$_SupervisorCodeFormStateCopyWith<$Res> {
  __$$_SupervisorCodeFormStateCopyWithImpl(_$_SupervisorCodeFormState _value,
      $Res Function(_$_SupervisorCodeFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
  }) {
    return _then(_$_SupervisorCodeFormState(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
    ));
  }
}

/// @nodoc

class _$_SupervisorCodeFormState extends _SupervisorCodeFormState {
  const _$_SupervisorCodeFormState(
      {this.invitationCode = const InvitationCode.pure()})
      : super._();

  @override
  @JsonKey()
  final InvitationCode invitationCode;

  @override
  String toString() {
    return 'SupervisorCodeFormState(invitationCode: $invitationCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupervisorCodeFormState &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invitationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupervisorCodeFormStateCopyWith<_$_SupervisorCodeFormState>
      get copyWith =>
          __$$_SupervisorCodeFormStateCopyWithImpl<_$_SupervisorCodeFormState>(
              this, _$identity);
}

abstract class _SupervisorCodeFormState extends SupervisorCodeFormState {
  const factory _SupervisorCodeFormState(
      {final InvitationCode invitationCode}) = _$_SupervisorCodeFormState;
  const _SupervisorCodeFormState._() : super._();

  @override
  InvitationCode get invitationCode;
  @override
  @JsonKey(ignore: true)
  _$$_SupervisorCodeFormStateCopyWith<_$_SupervisorCodeFormState>
      get copyWith => throw _privateConstructorUsedError;
}
