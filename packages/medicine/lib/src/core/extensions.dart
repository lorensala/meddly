import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  String toHHmm() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
