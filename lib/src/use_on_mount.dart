import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useOnMount(VoidCallback callback) {
  useEffect(() {
    callback();
    return null;
  }, []);
}

void useOnPostFrameMount(VoidCallback callback) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    return null;
  }, []);
}
