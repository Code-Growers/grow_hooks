import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void usePostFrameEffect(VoidCallback callback, List<Object?>? keys) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    return null;
  }, keys);
}
