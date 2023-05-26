import 'package:hive/hive.dart';
import 'package:medicine/src/core/core.dart';
import 'package:medicine/src/dto/medicine_dto.dart';

class MedicineCache {
  MedicineCache(this._box);

  final Box<List<MedicineDto>> _box;

  Future<void> write(List<MedicineDto> medicine) async {
    try {
      for (final med in medicine) {
        await _box.put(med.id, medicine);
      }
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  List<MedicineDto> read(String id) {
    try {
      final medicine = _box.get(id);
      if (medicine == null) throw MedicineNotFoundException();
      return medicine;
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
