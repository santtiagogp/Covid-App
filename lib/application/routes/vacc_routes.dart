import 'package:flutter/material.dart';

import '../pages/vaccination/config/vacc_locallizations.dart';
import '../pages/vaccination/vaccination_page.dart';

class VaccinationRoutes {
  VaccinationRoutes._();

  static VaccinationPage getInitialPage(BuildContext context) {
    final language = VaccPageLocalizations.of(context)!.getJsonTranslate();
    return VaccinationPage(
      language: language,
    );
  }
}