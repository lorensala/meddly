import 'package:hooks_riverpod/hooks_riverpod.dart';

final appointmentProvider = StateNotifierProvider.autoDispose((ref) {
  return Appointment();
});

class Appointment extends StateNotifier<int> {
  Appointment() : super(0);

  void increment() => state++;
  void decrement() => state--;
}
