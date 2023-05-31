import 'package:supervisor/src/api/supervisor_api.dart';
import 'package:supervisor/src/core/exceptions.dart';
import 'package:user/user.dart';

class SupervisorRepository {
  const SupervisorRepository({required SupervisorApi api}) : _api = api;

  final SupervisorApi _api;

  Future<(SupervisorException?, List<User>)> getSupervisors() async {
    try {
      final supervisors = await _api.getSupervisors();
      return (null, supervisors);
    } on SupervisorException catch (e) {
      return (e, <User>[]);
    } catch (e) {
      return (SupervisorUnknownException(), <User>[]);
    }
  }

  Future<(SupervisorException?, List<User>)> getSupervised() async {
    try {
      final supervised = await _api.getSupervised();
      return (null, supervised);
    } on SupervisorException catch (e) {
      return (e, <User>[]);
    } catch (e) {
      return (SupervisorUnknownException(), <User>[]);
    }
  }

  Future<(SupervisorException?, void)> acceptInvitation(String id) async {
    try {
      await _api.acceptInvitation(id);
      return (null, null);
    } on SupervisorException catch (e) {
      return (e, null);
    } catch (e) {
      return (SupervisorUnknownException(), null);
    }
  }

  Future<(SupervisorException?, void)> deleteSupervisor(String id) async {
    try {
      await _api.deleteSupervisor(id);
      return (null, null);
    } on SupervisorException catch (e) {
      return (e, null);
    } catch (e) {
      return (SupervisorUnknownException(), null);
    }
  }

  Future<(SupervisorException?, void)> deleteSupervised(String id) async {
    try {
      await _api.deleteSupervised(id);
      return (null, null);
    } on SupervisorException catch (e) {
      return (e, null);
    } catch (e) {
      return (SupervisorUnknownException(), null);
    }
  }
}
