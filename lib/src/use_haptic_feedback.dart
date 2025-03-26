import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import './use_on_mount.dart';

/// Wrapper hook around `haptic_feedback` library.
/// ```dart
/// final successFeedback = useHapticFeedback(HapticsType.success);
/// successFeedback(); // device vrrrr
/// ```
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

/// Wrapper hook around `haptic_feedback` library. Provides a haptic feedback anytime provided value changes.
/// Doesn't get called on initial render.
/// ```dart
/// useValueChangedHapticFeedback(true, HapticsType.success);
/// ```
void useValueChangedHapticFeedback(Object? value,
    [HapticsType type = HapticsType.heavy]) {
  final feedback = useHapticFeedback(type);
  useValueChanged(value, (_, __) {
    feedback();
    return false;
  });
}

/// Wrapper hook around `haptic_feedback` library. Provides a haptic feedback when widget mounts.
/// ```dart
/// useOnMountHaptic(HapticsType.success);
/// ```
void useOnMountHaptic([HapticsType type = HapticsType.heavy]) {
  final feedback = useHapticFeedback(type);
  useOnPostFrameMount(feedback);
}
