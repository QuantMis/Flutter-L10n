import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocal {
  static AppLocalizations? _loc;

  static AppLocalizations get loc {
    return AppLocal._loc!;
  }

  static void init(BuildContext context) {
    _loc = AppLocalizations.of(context);
  }
}
