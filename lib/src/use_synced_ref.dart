import 'package:flutter_hooks/flutter_hooks.dart';

ObjectRef<T> useSyncedRef<T>(T value) {
  final ref = useRef(value);
  useEffect(() {
    ref.value = value;
    return null;
  }, [value]);

  return ref;
}
