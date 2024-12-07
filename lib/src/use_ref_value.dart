import 'package:flutter_hooks/flutter_hooks.dart';

T useRefValue<T>(T value) {
  final ref = useRef(value);
  return ref.value;
}
