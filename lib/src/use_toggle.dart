import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Easily manage a boolean state
/// ```dart
/// final (isToggled, toggle) = useToggle(initial: false);
/// print(isToggled); // false
/// toggle();
/// print(isToggled); // true
/// ```
(bool, VoidCallback) useToggle({bool initial = false}) {
  final toggle = useState<bool>(initial);
  return (toggle.value, () => toggle.value = !toggle.value);
}
