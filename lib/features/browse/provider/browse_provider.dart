import 'package:riverpod/riverpod.dart';

final browseProvider = StateNotifierProvider.autoDispose((ref) {
  return Browse();
});

class Browse extends StateNotifier<int> {
  Browse() : super(0);

  void increment() => state++;
  void decrement() => state--;
}
