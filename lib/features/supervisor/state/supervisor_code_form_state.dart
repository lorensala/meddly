import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'supervisor_code_form_state.freezed.dart';

@freezed
class SupervisorCodeFormState with _$SupervisorCodeFormState, FormzMixin {
  const factory SupervisorCodeFormState({
    @Default(InvitationCode.pure()) InvitationCode invitationCode,
  }) = _SupervisorCodeFormState;

  const SupervisorCodeFormState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [invitationCode];
}
