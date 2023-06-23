import 'package:predictions/predictions.dart';

sealed class Consult {
  final int id;
  final List<Prediction> prediction;
  final DateTime createdAt;
  final bool verified;

  const Consult._({
    required this.id,
    required this.prediction,
    required this.createdAt,
    required this.verified,
  });

  factory Consult.fromJson(Map<String, dynamic> json) {
    if (json['image_name'] == null) {
      return ConsultBySymptoms.fromJson(json);
    } else {
      return ConsultByImage.fromJson(json);
    }
  }
}

class ConsultBySymptoms extends Consult {
  final List<String> symptoms;

  const ConsultBySymptoms({
    required int id,
    required List<Prediction> prediction,
    required DateTime createdAt,
    required bool verified,
    required this.symptoms,
  }) : super._(
          id: id,
          prediction: prediction,
          createdAt: createdAt,
          verified: verified,
        );

  factory ConsultBySymptoms.fromJson(Map<String, dynamic> json) {
    return ConsultBySymptoms(
      id: json['id'] as int,
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      verified: json['verified'] as bool,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      // symptoms: (json['symptoms'] as List<dynamic>)
      //     .map((e) => Symptom.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );
  }
}

class ConsultByImage extends Consult {
  final String image;

  const ConsultByImage({
    required int id,
    required List<Prediction> prediction,
    required DateTime createdAt,
    required bool verified,
    required this.image,
  }) : super._(
          id: id,
          prediction: prediction,
          createdAt: createdAt,
          verified: verified,
        );

  factory ConsultByImage.fromJson(Map<String, dynamic> json) {
    return ConsultByImage(
      id: json['id'] as int,
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      verified: json['verified'] as bool,
      image: json['image_name'] as String,
    );
  }
}
