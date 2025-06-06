import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Periodically trigger a callback when duration elapses
/// Callback can be changed during the lifecycle, which it refresh the timer
/// Make sure that it's memoized correctly
/// ```dart
/// useInterval(() => print('elapsed'), const Duration(seconds: 1), enabled: true);
/// ```
void useInterval(VoidCallback callback, Duration duration,
    {bool enabled = true}) {
  useEffect(() {
    if (enabled) {
      final timer = Timer.periodic(duration, (_) {
        callback();
      });
      return () => timer.cancel();
    }
    return null;
  }, [callback, enabled]);
}
