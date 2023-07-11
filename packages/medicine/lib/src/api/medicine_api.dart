import 'package:dio/dio.dart';
import 'package:medicine/medicine.dart';

class MedicineApi {
  MedicineApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  Future<List<Medicine>> fetchAll({required CancelToken cancelToken}) async {
    late final Response<List<dynamic>> res;
    try {
      res =
          await _dio.get<List<dynamic>>(medicinePath, cancelToken: cancelToken);

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

  Future<void> addMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    try {
      await _dio.post<dynamic>(medicinePath,
          data: medicine.toJson(), cancelToken: cancelToken);
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  Future<void> deleteMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    try {
      await _dio.delete<dynamic>('${medicinePath}/${medicine.id}',
          cancelToken: cancelToken);
    } on DioError catch (e) {
      throw MedicineException.fromDioError(e);
    } catch (_) {
      throw const MedicineUnknownException();
    }
  }

  Future<Medicine> updateMedicine(Medicine medicine,
      {required CancelToken cancelToken}) async {
    late final Response<Map<String, dynamic>> res;
    try {
      res = await _dio.post<Map<String, dynamic>>(
        medicinePath,
        data: medicine.toJson(),
        cancelToken: cancelToken,
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
