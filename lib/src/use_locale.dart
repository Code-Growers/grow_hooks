import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// return locale from Localizations provider
/// Throws in case Localizations provider is not found within the widget tree scope
/// ```dart
/// useLocale() // Locale()
/// ```
Locale useLocale() {
  final context = useContext();
  return Localizations.localeOf(context);
}
