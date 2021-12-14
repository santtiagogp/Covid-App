import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPageLocalizations {
  final Locale locale;

  SettingsPageLocalizations(this.locale);

  static SettingsPageLocalizations? of(BuildContext context) =>
      Localizations.of<SettingsPageLocalizations>(context, SettingsPageLocalizations);

  static const LocalizationsDelegate<SettingsPageLocalizations> delegate =
      SettingsPageLocalizationsDelegate();

  late Map<String, dynamic> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/lang/${locale.languageCode}/vacc.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });
    return true;
  }

  String translate(String key) => _localizedStrings[key];

  Map<String, dynamic> getJsonTranslate() => _localizedStrings;
}

class SettingsPageLocalizationsDelegate
    extends LocalizationsDelegate<SettingsPageLocalizations> {
  const SettingsPageLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<SettingsPageLocalizations> load(Locale locale) async {
    SettingsPageLocalizations localizations = SettingsPageLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(SettingsPageLocalizationsDelegate old) => false;
}