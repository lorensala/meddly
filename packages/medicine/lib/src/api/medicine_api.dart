import 'package:dio/dio.dart';
import 'package:medicine/src/core/constants.dart';
import 'package:medicine/src/core/exceptions.dart';
import 'package:medicine/src/dto/dto.dart';
import 'package:medicine/src/dto/medicine_dto.dart';

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
  Future<List<MedicineDto>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(medicinePath);

      if (res.statusCode == 401) {
        throw MedicineNotFoundException();
      }
    } on DioError catch (e) {
      throw MedicineDioException(e);
    }

    try {
      return res.data!
          .map((e) => MedicineDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw MedicineSerializationException();
    }
  }

  /// Adds a new medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.
  Future<void> addMedicine(MedicineDto medicine) async {
    try {
      await _dio.post<dynamic>(medicinePath, data: medicine.toJson());
    } on DioError catch (e) {
      throw MedicineDioException(e);
    }
  }

  /// Deletes a medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.
  Future<void> deleteMedicine(MedicineDto medicine) async {
    try {
      await _dio.delete<dynamic>(medicinePath, data: medicine.toJson());
    } on DioError catch (e) {
      throw MedicineDioException(e);
    }
  }

  /// Updates a medicine.
  ///
  /// Throws a [MedicineDioException] if the request fails.\
  /// Throws a [MedicineSerializationException] if the response data cannot be
  /// serialized.
  Future<MedicineDto> updateMedicine(
    MedicineDto medicine,
  ) async {
    late final Response<Map<String, dynamic>> res;
    try {
      res = await _dio.post<Map<String, dynamic>>(
        medicinePath,
        data: medicine.toJson(),
      );
    } on DioError catch (e) {
      throw MedicineDioException(e);
    }

    try {
      return MedicineDto.fromJson(res.data!);
    } catch (_) {
      throw MedicineSerializationException();
    }
  }
}
