import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Function({T returnData}) useNavigatorPop<T>() {
  final context = useContext();

  return ({T? returnData}) {
    try {
      Navigator.of(context).pop(returnData);
    } catch (_) {
      // context might be dead
    }
  };
}
