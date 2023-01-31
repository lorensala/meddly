// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_date_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedDateState {
  List<DateTime> get daysOfTheYear => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedDateStateCopyWith<SelectedDateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedDateStateCopyWith<$Res> {
  factory $SelectedDateStateCopyWith(
          SelectedDateState value, $Res Function(SelectedDateState) then) =
      _$SelectedDateStateCopyWithImpl<$Res, SelectedDateState>;
  @useResult
  $Res call({List<DateTime> daysOfTheYear, DateTime? selectedDate});
}

/// @nodoc
class _$SelectedDateStateCopyWithImpl<$Res, $Val extends SelectedDateState>
    implements $SelectedDateStateCopyWith<$Res> {
  _$SelectedDateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOfTheYear = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      daysOfTheYear: null == daysOfTheYear
          ? _value.daysOfTheYear
          : daysOfTheYear // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectedDateStateCopyWith<$Res>
    implements $SelectedDateStateCopyWith<$Res> {
  factory _$$_SelectedDateStateCopyWith(_$_SelectedDateState value,
          $Res Function(_$_SelectedDateState) then) =
      __$$_SelectedDateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DateTime> daysOfTheYear, DateTime? selectedDate});
}

/// @nodoc
class __$$_SelectedDateStateCopyWithImpl<$Res>
    extends _$SelectedDateStateCopyWithImpl<$Res, _$_SelectedDateState>
    implements _$$_SelectedDateStateCopyWith<$Res> {
  __$$_SelectedDateStateCopyWithImpl(
      _$_SelectedDateState _value, $Res Function(_$_SelectedDateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOfTheYear = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_$_SelectedDateState(
      daysOfTheYear: null == daysOfTheYear
          ? _value._daysOfTheYear
          : daysOfTheYear // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_SelectedDateState implements _SelectedDateState {
  const _$_SelectedDateState(
      {final List<DateTime> daysOfTheYear = const [], this.selectedDate})
      : _daysOfTheYear = daysOfTheYear;

  final List<DateTime> _daysOfTheYear;
  @override
  @JsonKey()
  List<DateTime> get daysOfTheYear {
    if (_daysOfTheYear is EqualUnmodifiableListView) return _daysOfTheYear;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfTheYear);
  }

  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'SelectedDateState(daysOfTheYear: $daysOfTheYear, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedDateState &&
            const DeepCollectionEquality()
                .equals(other._daysOfTheYear, _daysOfTheYear) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_daysOfTheYear), selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedDateStateCopyWith<_$_SelectedDateState> get copyWith =>
      __$$_SelectedDateStateCopyWithImpl<_$_SelectedDateState>(
          this, _$identity);
}

abstract class _SelectedDateState implements SelectedDateState {
  const factory _SelectedDateState(
      {final List<DateTime> daysOfTheYear,
      final DateTime? selectedDate}) = _$_SelectedDateState;

  @override
  List<DateTime> get daysOfTheYear;
  @override
  DateTime? get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$_SelectedDateStateCopyWith<_$_SelectedDateState> get copyWith =>
      throw _privateConstructorUsedError;
}
