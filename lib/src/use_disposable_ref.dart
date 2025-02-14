import 'package:flutter_hooks/flutter_hooks.dart';

/// Allows to call any cleanup/dispose functions on Singletons saved inside of `useRef` hook.
/// ```dart
/// final controller = useDisposableRef(TabController(), onMount: (tabController) => print('mounted'),  onDispose: (tabController) => tabController.dispose());
/// ```
T useDisposableRef<T>(
  T instance, {
  Function(T)? onMount,
  Function(T)? onDispose,
}) {
  final instanceRef = useRef<T>(instance);

  useEffect(
    () {
      onMount?.call(instanceRef.value);
      return () => onDispose?.call(instanceRef.value);
    },
    [],
  );

  return instanceRef.value;
}
