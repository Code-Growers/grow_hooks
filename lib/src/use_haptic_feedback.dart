import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

VoidCallback useHapticFeedback() {
  return () async {
    try {
      if (await Vibrate.canVibrate) {
        Vibrate.feedback(FeedbackType.heavy);
      }
    } catch (e) {
      // deliberately left empty
    }
  };
}
