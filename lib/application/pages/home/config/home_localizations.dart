import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageLocalizations {
  final Locale locale;

  HomePageLocalizations(this.locale);

  static HomePageLocalizations? of(BuildContext context) =>
      Localizations.of<HomePageLocalizations>(context, HomePageLocalizations);

  static const LocalizationsDelegate<HomePageLocalizations> delegate =
      HomePageLocalizationsDelegate();

  late Map<String, dynamic> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/lang/${locale.languageCode}/home.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });
    return true;
  }

  String translate(String key) => _localizedStrings[key];

  Map<String, dynamic> getJsonTranslate() => _localizedStrings;
}

class HomePageLocalizationsDelegate
    extends LocalizationsDelegate<HomePageLocalizations> {
  const HomePageLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<HomePageLocalizations> load(Locale locale) async {
    HomePageLocalizations localizations = HomePageLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(HomePageLocalizationsDelegate old) => false;
}