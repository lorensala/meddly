import 'package:dio/dio.dart';
import 'package:medicine/medicine.dart';

class MedicineApi {
  MedicineApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  Future<List<Medicine>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(medicinePath);

      if (res.statusCode == 401) {
        throw MedicineNotFoundException();
      }
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    }

    try {
      return res.data!
          .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw MedicineSerializationException();
    }
  }

  Future<void> addMedicine(Medicine medicine) async {
    try {
      await _dio.post<dynamic>(medicinePath, data: medicine.toJson());
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  Future<void> deleteMedicine(Medicine medicine) async {
    try {
      await _dio.delete<dynamic>('${medicinePath}/${medicine.id}');
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  Future<Medicine> updateMedicine(
    Medicine medicine,
  ) async {
    late final Response<Map<String, dynamic>> res;
    try {
      res = await _dio.post<Map<String, dynamic>>(
        medicinePath,
        data: medicine.toJson(),
      );
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    }

    try {
      return Medicine.fromJson(res.data!);
    } catch (_) {
      throw MedicineSerializationException();
    }
  }
}
