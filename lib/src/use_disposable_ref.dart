import 'package:flutter_hooks/flutter_hooks.dart';

T useDisposableRef<T>(T instance, {Function(T)? onDispose}) {
  final instanceRef = useRef<T>(instance);

  useEffect(() => () => onDispose?.call(instanceRef.value), []);

  return instanceRef.value;
}
