import 'package:covid_app/application/pages/home/config/home_localizations.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

class HomeRoutes {

  HomeRoutes._();

  static HomePage getInitialPage(BuildContext context) {
    final language = HomePageLocalizations.of(context)!.getJsonTranslate();
    return HomePage(
      language: language,
    );
  }
}