import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VaccPageLocalizations {
  final Locale locale;

  VaccPageLocalizations(this.locale);

  static VaccPageLocalizations? of(BuildContext context) =>
      Localizations.of<VaccPageLocalizations>(context, VaccPageLocalizations);

  static const LocalizationsDelegate<VaccPageLocalizations> delegate =
      VaccPageLocalizationsDelegate();

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

class VaccPageLocalizationsDelegate
    extends LocalizationsDelegate<VaccPageLocalizations> {
  const VaccPageLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<VaccPageLocalizations> load(Locale locale) async {
    VaccPageLocalizations localizations = VaccPageLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(VaccPageLocalizationsDelegate old) => false;
}