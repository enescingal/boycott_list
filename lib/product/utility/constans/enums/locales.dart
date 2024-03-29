import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US')),

  /// English locale
  ar(Locale('ar', 'AR'));

  /// Locale value
  final Locale locale;

  /// Locales get
  const Locales(this.locale);
}
