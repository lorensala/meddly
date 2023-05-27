import 'package:hive/hive.dart';
import 'package:medicine/medicine.dart';

class MedicineCache {
  MedicineCache(this._box);

  final Box<Map<String, dynamic>> _box;

  Future<void> write(List<Medicine> medicine) async {
    try {
      for (final med in medicine) {
        await _box.put(med.id, med.toJson());
      }
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  Medicine read(String id) {
    try {
      final medicine = _box.get(id);
      if (medicine == null) throw MedicineNotFoundException();
      return Medicine.fromJson(medicine);
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  Future<void> delete(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      throw MedicineCacheException();
    }
  }
}
