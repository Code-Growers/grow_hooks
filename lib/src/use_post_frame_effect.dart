import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Simple wrapper around `useEffect` hook. The only difference that inner callback is wrapped inside `addPostFrameCallback`.
/// Note that since we are wrapping our callback inside `addPostFrameCallback`, there is no cleanup function support.
/// ```dart
/// usePostFrameEffect(() {
///   print('keys have changed and I'm called after PostFrame');
/// }, [true]);
/// ```
void usePostFrameEffect(VoidCallback callback, List<Object?>? keys) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    return null;
  }, keys);
}
