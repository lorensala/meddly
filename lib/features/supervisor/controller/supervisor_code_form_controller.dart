import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'supervisor_code_form_controller.g.dart';

@riverpod
class SupervisorCodeFormController extends _$SupervisorCodeFormController {
  @override
  SupervisorCodeFormState build() {
    return const SupervisorCodeFormState();
  }

  void codeChanged(String value) {
    state = state.copyWith(
      invitationCode: InvitationCode.dirty(value),
    );
  }

  void submit() {
    if (state.isNotValid) return;

    ref
        .read(supervisorControllerProvider.notifier)
        .acceptInvitation(state.invitationCode.value);
  }
}
