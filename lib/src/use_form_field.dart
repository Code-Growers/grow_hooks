import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(TextEditingController, FocusNode) useFormField([String? defaultValue]) {
  final focusNode = useFocusNode();
  final controller = useTextEditingController(text: defaultValue);

  return (controller, focusNode);
}
