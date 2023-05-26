import 'package:medicine/medicine.dart';

class MedicineRepository {
  MedicineRepository({
    required MedicineApi api,
    required MedicineCache cache,
  })  : _api = api,
        _cache = cache;

  final MedicineApi _api;
  final MedicineCache _cache;

  Future<(MedicineException?, List<Medicine>)> fetchAll() async {
    try {
      final medicines = await _api.fetchAll();

      return (null, medicines);
    } on MedicineException catch (e) {
      return (e, <Medicine>[]);
    } catch (e) {
      return (const MedicineUnknownException(), <Medicine>[]);
    }
  }

  Future<(MedicineException?, void)> addMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.addMedicine(medicine);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> deleteMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.deleteMedicine(medicine);
      await _cache.delete(medicine.id.toString());

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> updateMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.updateMedicine(medicine);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }
}
