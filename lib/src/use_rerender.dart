import 'dart:async';
import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';

/// Forces widget rerender by internally incrementing `useState` value.
/// ```dart
/// final (rerender, key) = useRerender();
/// print(key); // 0
/// rerender(); // 0
/// print(key); // 1
/// ```
(VoidCallback, int) useRerender() {
  final index = useState(0);
  return (() => index.value = index.value + 1, index.value);
}

/// Periodically rerenders widget by internally incrementing `useState` value.
/// Note that duration value can't be changed during the lifecycle of this hook.
/// ```dart
/// final key = usePeriodicRerender(const Duration(seconds: 1), isEnabled: true);
/// print(key); // 0
/// wait(const Duration(seconds: 1));
/// print(key); // 1
/// ```
int usePeriodicRerender(Duration duration, {bool isEnabled = true}) {
  final (rerender, key) = useRerender();
  useEffect(() {
    if (!isEnabled) {
      return null;
    }
    final timer = Timer.periodic(duration, (timer) {
      rerender();
    });
    return () => timer.cancel();
  }, [isEnabled]);

  return key;
}
