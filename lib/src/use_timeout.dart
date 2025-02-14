import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'use_on_mount.dart';

/// Trigger a callback when duration elapses
/// ```dart
/// useTimeout(() => print('elapsed'), const Duration(seconds: 1));
/// ```
void useTimeout(VoidCallback callback, Duration duration) {
  final context = useContext();

  useOnMount(() async {
    await Future.delayed(duration);
    if (context.mounted) {
      callback();
    }
  });
}
