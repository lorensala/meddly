import 'package:hive/hive.dart';
import 'package:medicine/src/core/core.dart';
import 'package:medicine/src/dto/medicine_dto.dart';

/// {@template medicine_cache}
/// Cache for medicine operations.
/// {@endtemplate}
class MedicineCache {
  /// {@macro medicine_cache}
  MedicineCache(this._box);

  final Box<List<MedicineDto>> _box;

  /// Writes a medicine to the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be written to the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// serialized.
  Future<void> write(List<MedicineDto> medicine) async {
    try {
      for (final med in medicine) {
        await _box.put(med.id, medicine);
      }
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  /// Reads a medicine from the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be read from the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  List<MedicineDto> read(String id) {
    try {
      final medicine = _box.get(id);
      if (medicine == null) throw MedicineNotFoundException();
      return medicine;
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  /// Deletes a medicine from the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be deleted from
  /// the cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  Future<void> delete(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  /// Clears the cache.
  ///
  /// Throws a [MedicineCacheException] if the cache cannot be cleared.
  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      throw MedicineCacheException();
    }
  }
}
