import 'package:hive/hive.dart';
import 'package:medicine/src/core/core.dart';
import 'package:medicine/src/dto/medicine_dto.dart';

/// {@template medicine_cache}
/// Cache for medicine operations.
/// {@endtemplate}
class MedicineCache {
  /// {@macro medicine_cache}
  MedicineCache(this._box);

  final Box<Map<String, dynamic>> _box;

  /// Watches all medicines in the cache.
  ///
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  Stream<List<MedicineDto>> watchAll() {
    return _box.watch().map((BoxEvent event) {
      final medicines = <MedicineDto>[];
      for (final medicineJson in event.value as List<Map<String, dynamic>>) {
        try {
          medicines.add(MedicineDto.fromJson(medicineJson));
        } catch (e) {
          throw MedicineSerializationException();
        }
      }
      return medicines;
    });
  }

  /// Writes a medicine to the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be written to the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// serialized.
  Future<void> write(MedicineDto medicine) async {
    late final Map<String, dynamic> medicineJson;
    try {
      medicineJson = medicine.toJson();
    } catch (e) {
      throw MedicineSerializationException();
    }

    try {
      await _box.put(medicine.id, medicineJson);
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
    final medicines = <MedicineDto>[];
    for (final medicineJson in _box.values) {
      try {
        medicines.add(MedicineDto.fromJson(medicineJson));
      } catch (e) {
        throw MedicineSerializationException();
      }
    }
    return medicines;
  }

  /// Reads a medicine from the cache.
  ///
  /// Throws a [MedicineCacheException] if the medicine cannot be read from the
  /// cache.\
  /// Throws a [MedicineSerializationException] if the medicine cannot be
  /// deserialized.
  MedicineDto read(String id) {
    late final Map<String, dynamic> medicineJson;
    try {
      medicineJson = _box.get(id)!;
    } catch (e) {
      throw MedicineCacheException();
    }

    try {
      return MedicineDto.fromJson(medicineJson);
    } catch (e) {
      throw MedicineSerializationException();
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
