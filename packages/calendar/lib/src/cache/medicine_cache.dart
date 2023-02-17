import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/medicine_dto.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

/// {@template medicine_cache}
/// Cache for medicine operations.
/// {@endtemplate}
class MedicineCache {
  /// {@macro medicine_cache}
  MedicineCache(this._box);

  final Box<MedicineDto> _box;

  /// Watches all medicines in the cache.
  ///
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  Stream<List<MedicineDto>> get medicines => _box.watch().map((BoxEvent event) {
        final medicines = <MedicineDto>[];
        for (final medicineJson in event.value as List<Map<String, dynamic>>) {
          try {
            medicines.add(MedicineDto.fromJson(medicineJson));
          } catch (e) {
            throw MedicineSerializationException();
          }
        }
        return medicines;
      }).startWith(readAll());

  /// Writes a medicine to the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be written to the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// serialized.
  Future<void> write(MedicineDto medicine) async {
    try {
      await _box.put(medicine.id, medicine);
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  /// Writes a list of medicines to the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be written to the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// serialized.
  Future<void> writeAll(List<MedicineDto> medicines) async {
    for (final medicine in medicines) {
      await write(medicine);
    }
  }

  /// Reads all medicines from the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be read from the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  List<MedicineDto> readAll() {
    try {
      final medicines = _box.values.toList();
      return medicines;
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
  MedicineDto read(String id) {
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
