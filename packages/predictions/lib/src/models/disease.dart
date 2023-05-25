import 'package:freezed_annotation/freezed_annotation.dart';

part 'disease.freezed.dart';

@freezed
class Disease with _$Disease {
  const factory Disease({
    required String disease,
    required double probability,
  }) = _Disease;
}
