import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:medicine/medicine.dart';

class MedicineCache {
  MedicineCache(this._box);

  final Box<String> _box;

  Future<void> write(Medicine medicine) async {
    try {
      await _box.put(medicine.id.toString(), jsonEncode(medicine.toJson()));
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  Medicine read(String id) {
    try {
      final medicine = _box.get(id);
      if (medicine == null) throw MedicineNotFoundException();
      return Medicine.fromJson(medicine as Map<String, dynamic>);
    } catch (e) {
      throw MedicineCacheException();
    }
  }

  List<Medicine> readAll() {
    try {
      return _box.values
          .map((e) => Medicine.fromJson(jsonDecode(e) as Map<String, dynamic>))
          .toList();
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
