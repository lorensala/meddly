import 'package:dio/dio.dart';
import 'package:medicine/medicine.dart';

/// {@template treatment_api}
/// API for medicine operations.
/// {@endtemplate}
class MedicineApi {
  /// {@macro treatment_api}
  MedicineApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// Fetches all medicines.
  ///
  /// Throws a [MedicineNotFoundException] if the response status code is 401.\
  /// Throws a [MedicineDioException] if the request fails.\
  /// Throws a [MedicineSerializationException] if the response data cannot be
  /// serialized.
  Future<List<Medicine>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(medicinesPath);

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

  /// Adds a new medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.
  Future<void> addMedicine(Medicine medicine) async {
    try {
      await _dio.post<dynamic>(medicinePath, data: medicine.toJson());
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  /// Deletes a medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.
  Future<void> deleteMedicine(Medicine medicine) async {
    try {
      await _dio.delete<dynamic>(medicinePath, data: medicine.toJson());
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  /// Updates a medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.\
  /// Throws a [MedicineSerializationException] if the response data cannot be
  /// serialized.
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
