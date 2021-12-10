import 'package:flutter/material.dart';

import '../../domain/use_case/covid_usecase.dart';
import '../../infrastructure/repository/covid_repository.dart';
import '../pages/home/config/home_localizations.dart';
import '../pages/home/home_page.dart';

class HomeRoutes {

  HomeRoutes._();

  static HomePage getInitialPage(BuildContext context) {
    final language = HomePageLocalizations.of(context)!.getJsonTranslate();
    return HomePage(
      language: language,
      useCase: CovidDataUseCase(CovidApi()),
    );
  }
}