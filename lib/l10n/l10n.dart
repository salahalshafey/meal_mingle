import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../src/app.dart';

class L10n {
  static final all = [
    const Locale("en"),
    const Locale("ar"),
  ];
}

class Strings {
  static BuildContext get _context => navigatorKey.currentState!.context;

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  /// ## Use it only for translation outside the UI widgets like:
  /// * APIs errors
  /// * General Functions, etc...
  /// ### It is useful because the `context` is not required.
  static AppLocalizations get get {
    return AppLocalizations.of(_context)!;
  }
}

extension Translation on String {
  static BuildContext get _context => navigatorKey.currentContext!;

  String trOf(BuildContext context) => translations[this]!(context);

  String get tr => translations[this]!(_context);
}

final translations = <String, String Function(BuildContext)>{
  "Scan Food With AI": (context) =>
      AppLocalizations.of(context)!.scanFoodWithAi,
};
