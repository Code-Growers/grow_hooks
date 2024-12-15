import 'package:flutter_hooks/flutter_hooks.dart';

/// Automatically synchronizes changing value into `useRef` hook.
/// Usefull in case you want to save some derived data inside of useRef, keeping previous value, etc..
/// ```dart
/// final ref = useSyncedRef(true);
/// print(ref.value); // true
/// final ref = useSyncedRef(false);
/// print(ref.value); // false
/// ```
ObjectRef<T> useSyncedRef<T>(T value) {
  final ref = useRef(value);
  useEffect(() {
    ref.value = value;
    return null;
  }, [value]);

  return ref;
}
