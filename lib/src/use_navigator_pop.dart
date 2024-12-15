import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Simple wrapper around Navigator.of(context).pop(); with generic return type support
/// ```dart
/// final pop = useNavigatorPop<bool>();
/// pop(true);
/// ```
Function({T returnData}) useNavigatorPop<T>() {
  final context = useContext();

  return ({T? returnData}) {
    if (context.mounted) {
      Navigator.of(context).pop(returnData);
    }
  };
}
