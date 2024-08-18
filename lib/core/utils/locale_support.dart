import 'package:flutter/material.dart';

import 'localization.dart';

extension LocaleSupport on BuildContext {
  AppLocalizations get locale {
    AppLocalizations? locale = AppLocalizations.of(this);

    if (locale == null) {
      throw Exception('Locale is requested before Localisation initalised');
    }

    return locale;
  }
}
