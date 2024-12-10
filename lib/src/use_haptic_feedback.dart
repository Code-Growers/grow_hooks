import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

VoidCallback useHapticFeedback([HapticsType type = HapticsType.heavy]) {
  return () async {
    try {
      if (await Haptics.canVibrate()) {
        Haptics.vibrate(type);
      }
    } catch (e) {
      // deliberately left empty
    }
  };
}
