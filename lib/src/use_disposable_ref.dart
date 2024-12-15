import 'package:flutter_hooks/flutter_hooks.dart';

/// Allows to call any cleanup/dispose functions on Singletons saved inside of `useRef` hook.
/// ```dart
/// final controller = useDisposableRef(TabController(), onDispose: (tabController) => tabController.dispose());
/// ```
T useDisposableRef<T>(T instance, {Function(T)? onDispose}) {
  final instanceRef = useRef<T>(instance);

  useEffect(() => () => onDispose?.call(instanceRef.value), []);

  return instanceRef.value;
}
