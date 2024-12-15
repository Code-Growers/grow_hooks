import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Automatically calls a provided void callback when value changes.
/// Callback is not fired during the initial render.
/// ```dart
/// useValueChangedCallback(true, () {
///   print('value has changed');
/// });
/// ```
void useValueChangedCallback<T>(
  T value,
  Function() valueChange,
) {
  final context = useContext();
  useValueChanged(value, (_, __) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        valueChange();
      }
    });
    return true;
  });
}
