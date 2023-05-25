import 'dart:async';

import 'package:flutter/material.dart' show VoidCallback;
import 'package:flutter_hooks/flutter_hooks.dart';

void useInterval({required VoidCallback callback, required Duration delay}) {
  final savedCallback = useRef(callback)..value = callback;

  useEffect(
    () {
      final timer = Timer.periodic(delay, (_) {
        savedCallback.value();
      });
      return timer.cancel;
    },
    [delay],
  );
}
