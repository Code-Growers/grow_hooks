import 'dart:async';
import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';

(VoidCallback, String) useRerender() {
  final index = useState(0);
  return (() => index.value = index.value + 1, index.toString());
}

String usePeriodicRerender(Duration duration, {bool isEnabled = true}) {
  final (rerender, key) = useRerender();
  useEffect(() {
    if (!isEnabled) {
      return null;
    }
    final timer = Timer.periodic(duration, (timer) {
      rerender();
    });
    return () => timer.cancel();
  }, [isEnabled]);

  return key;
}
