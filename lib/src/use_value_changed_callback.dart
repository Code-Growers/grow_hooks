import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
