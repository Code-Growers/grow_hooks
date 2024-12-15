import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Calls a provided callback before widget is unmounted from widget tree.
/// ```dart
/// useOnUnmount(() {
///   print('unmounted');
/// });
/// ```
void useOnUnmount(VoidCallback cb) {
  useEffect(() => () => cb(), []);
}
