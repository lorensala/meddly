import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_cubit.freezed.dart';
part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(const SetupState.initial());
}
