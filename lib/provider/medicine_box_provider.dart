import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/provider/provider.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_box_provider.g.dart';

@riverpod
Box<List<MedicineDto>> medicineBox(MedicineBoxRef ref) {
  final hive = ref.read(hiveProvider);
  return hive.box<List<MedicineDto>>(medicineBoxKey);
}
