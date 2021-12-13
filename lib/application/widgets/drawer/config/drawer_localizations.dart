import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerLocalizations {
  final Locale locale;

  DrawerLocalizations(this.locale);

  static DrawerLocalizations? of(BuildContext context) =>
      Localizations.of<DrawerLocalizations>(context, DrawerLocalizations);

  static const LocalizationsDelegate<DrawerLocalizations> delegate =
      DrawerLocalizationsDelegate();

  late Map<String, dynamic> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/lang/${locale.languageCode}/drawer.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });
    return true;
  }

  String translate(String key) => _localizedStrings[key];

  Map<String, dynamic> getJsonTranslate() => _localizedStrings;
}

class DrawerLocalizationsDelegate
    extends LocalizationsDelegate<DrawerLocalizations> {
  const DrawerLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<DrawerLocalizations> load(Locale locale) async {
    DrawerLocalizations localizations = DrawerLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(DrawerLocalizationsDelegate old) => false;
}