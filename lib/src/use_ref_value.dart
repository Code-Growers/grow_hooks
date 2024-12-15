import 'package:flutter_hooks/flutter_hooks.dart';

/// Simple wrapper around `useRef`, but emitting value instead of ObjectRef.
/// Use this in case you want a singleton instance of some class or other data structur.
/// ```dart
/// final singletonValue = useRefValue(Singleton());
/// ```
T useRefValue<T>(T value) {
  final ref = useRef(value);
  return ref.value;
}
