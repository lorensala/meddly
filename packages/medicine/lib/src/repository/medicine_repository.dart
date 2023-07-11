import 'package:dio/dio.dart';
import 'package:medicine/medicine.dart';

class MedicineRepository {
  MedicineRepository({
    required MedicineApi api,
    required MedicineCache cache,
  })  : _api = api,
        _cache = cache;

  final MedicineApi _api;
  final MedicineCache _cache;

  Future<(MedicineException?, List<Medicine>)> fetchAll(
      {required CancelToken cancelToken}) async {
    try {
      final medicines = await _api.fetchAll(cancelToken: cancelToken);

      return (null, medicines);
    } on MedicineException catch (e) {
      return (e, <Medicine>[]);
    } catch (e) {
      return (const MedicineUnknownException(), <Medicine>[]);
    }
  }

  Future<(MedicineException?, void)> addMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    try {
      await _api.addMedicine(medicine, cancelToken: cancelToken);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> deleteMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    try {
      await _api.deleteMedicine(medicine, cancelToken: cancelToken);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> updateMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    try {
      await _api.updateMedicine(medicine, cancelToken: cancelToken);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> archiveMedicine(
    Medicine medicine,
  ) async {
    try {
      await _cache.write(medicine);

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, void)> deleteArchivedMedicine(
    Medicine medicine,
  ) async {
    try {
      await _cache.delete(medicine.id.toString());

      return (null, null);
    } on MedicineException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MedicineUnknownException(), null);
    }
  }

  Future<(MedicineException?, List<Medicine>)> getArchivedMedicines() async {
    try {
      final medicines = await _cache.readAll();

      return (null, medicines);
    } on MedicineException catch (e) {
      return (e, <Medicine>[]);
    } catch (e) {
      return (const MedicineUnknownException(), <Medicine>[]);
    }
  }
}
