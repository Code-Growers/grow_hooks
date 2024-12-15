import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Calls a provided callback after widget mounts into widget tree.
/// ```dart
/// useOnMount(() {
///   print('mounted');
/// });
/// ```
void useOnMount(VoidCallback callback) {
  useEffect(() {
    callback();
    return null;
  }, []);
}

/// Calls a provided callback after widget mounts into widget tree.
/// Difference between `useOnMount` is that provided callback is wrapped inside `addPostFrameCallback` callback
/// ```dart
/// useOnPostFrameMount(() {
///   print('called after post frame callback on widget mounted');
/// });
/// ```
void useOnPostFrameMount(VoidCallback callback) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    return null;
  }, []);
}
