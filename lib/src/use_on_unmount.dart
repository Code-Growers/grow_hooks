import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useOnUnmount(VoidCallback cb) {
  useEffect(() => () => cb(), []);
}
