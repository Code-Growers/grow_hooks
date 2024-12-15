import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Simple Record wrapper around `useFocusNode` and `useTextEditingController` hooks.
/// ```dart
/// final (focusNode, textController) = useFormField('initial value');
/// ```
(TextEditingController, FocusNode) useFormField([String? defaultValue]) {
  final focusNode = useFocusNode();
  final controller = useTextEditingController(text: defaultValue);

  return (controller, focusNode);
}
