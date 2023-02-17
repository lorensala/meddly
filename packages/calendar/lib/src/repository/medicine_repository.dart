import 'package:calendar/src/api/api.dart';
import 'package:calendar/src/cache/cache.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

/// {@template medicine_repository}
/// Repository for medicine operations.
/// {@endtemplate}
class MedicineRepository {
  /// {@macro medicine_repository}
  MedicineRepository({
    required MedicineApi api,
    required MedicineCache cache,
  })  : _api = api,
        _cache = cache;

  final MedicineApi _api;
  final MedicineCache _cache;

  /// Watches the medicines from the cache.
  Stream<Either<MedicineFailure, List<Medicine>>> get medicines =>
      _cache.medicines
          .map<Either<MedicineFailure, List<Medicine>>>(
            (medicineDtoList) => Right(
              medicineDtoList.map((e) => e.toDomain()).toList(),
            ),
          )
          .onErrorReturnWith((error, _) => const Left(MedicineFailure.cache()));

  /// Fetches all medicines.
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Future<Either<MedicineFailure, Unit>> fetchAll() async {
    try {
      final medicines = await _api.fetchAll();
      await _cache.writeAll(medicines);
      return const Right(unit);
    } on MedicineNotFoundException {
      return const Left(MedicineFailure.notFound());
    } on MedicineDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.sendTimeout:
          return const Left(MedicineFailure.sendTimeout());
        case DioErrorType.receiveTimeout:
          return const Left(MedicineFailure.receiveTimeout());
        case DioErrorType.response:
          return const Left(MedicineFailure.response());
        case DioErrorType.cancel:
          return const Left(MedicineFailure.cancel());
        case DioErrorType.other:
          return const Left(MedicineFailure.unknown());
        case DioErrorType.connectTimeout:
          return const Left(MedicineFailure.connectionTimeOut());
      }
    } on MedicineSerializationException {
      return const Left(MedicineFailure.serialization());
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }

  /// Gets all medicines from cache.
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Either<MedicineFailure, List<Medicine>> getAll() {
    try {
      final medicineDtoList = _cache.readAll();

      return Right(
        medicineDtoList.map((e) => e.toDomain()).toList(),
      );
    } on MedicineSerializationException {
      return const Left(MedicineFailure.serialization());
    } on MedicineCacheException {
      return const Left(MedicineFailure.cache());
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }

  /// Gets a medicine from cache
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Either<MedicineFailure, Medicine> get(String id) {
    try {
      final medicineDto = _cache.read(id);

      return Right(medicineDto.toDomain());
    } on MedicineSerializationException {
      return const Left(MedicineFailure.serialization());
    } on MedicineCacheException {
      return const Left(MedicineFailure.cache());
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }

  /// Add a medicine
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Future<Either<MedicineFailure, Unit>> addMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.addMedicine(MedicineDto.fromDomain(medicine));
      await _cache.write(MedicineDto.fromDomain(medicine));
      return const Right(unit);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.sendTimeout:
          return const Left(MedicineFailure.sendTimeout());
        case DioErrorType.receiveTimeout:
          return const Left(MedicineFailure.receiveTimeout());
        case DioErrorType.response:
          return const Left(MedicineFailure.response());
        case DioErrorType.cancel:
          return const Left(MedicineFailure.cancel());
        case DioErrorType.other:
          return const Left(MedicineFailure.unknown());
        case DioErrorType.connectTimeout:
          return const Left(MedicineFailure.connectionTimeOut());
      }
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }

  /// Delete a medicine
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Future<Either<MedicineFailure, Unit>> deleteMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.deleteMedicine(MedicineDto.fromDomain(medicine));
      await _cache.delete(medicine.id.toString());

      return const Right(unit);
    } on MedicineCacheException {
      return const Left(MedicineFailure.cache());
    } on MedicineNotFoundException {
      return const Left(MedicineFailure.notFound());
    } on MedicineDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.sendTimeout:
          return const Left(MedicineFailure.sendTimeout());
        case DioErrorType.receiveTimeout:
          return const Left(MedicineFailure.receiveTimeout());
        case DioErrorType.response:
          return const Left(MedicineFailure.response());
        case DioErrorType.cancel:
          return const Left(MedicineFailure.cancel());
        case DioErrorType.other:
          return const Left(MedicineFailure.unknown());
        case DioErrorType.connectTimeout:
          return const Left(MedicineFailure.connectionTimeOut());
      }
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }

  /// Update a medicine
  ///
  /// Returns a [MedicineFailure] if the request fails.
  Future<Either<MedicineFailure, Unit>> updateMedicine(
    Medicine medicine,
  ) async {
    try {
      await _api.updateMedicine(MedicineDto.fromDomain(medicine));
      await _cache.write(MedicineDto.fromDomain(medicine));

      return const Right(unit);
    } on MedicineCacheException {
      return const Left(MedicineFailure.cache());
    } on MedicineNotFoundException {
      return const Left(MedicineFailure.notFound());
    } on MedicineDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.sendTimeout:
          return const Left(MedicineFailure.sendTimeout());
        case DioErrorType.receiveTimeout:
          return const Left(MedicineFailure.receiveTimeout());
        case DioErrorType.response:
          return const Left(MedicineFailure.response());
        case DioErrorType.cancel:
          return const Left(MedicineFailure.cancel());
        case DioErrorType.other:
          return const Left(MedicineFailure.unknown());
        case DioErrorType.connectTimeout:
          return const Left(MedicineFailure.connectionTimeOut());
      }
    } catch (e) {
      return const Left(MedicineFailure.unknown());
    }
  }
}
