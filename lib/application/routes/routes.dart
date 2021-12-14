import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/vaccination/vaccination_page.dart';
import 'home_routes.dart';
import 'settings_routes.dart';
import 'vacc_routes.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomePage.pageName : HomeRoutes.getInitialPage,
  VaccinationPage.pageName : VaccinationRoutes.getInitialPage,
  SettingsPage.pageName : SettingsRoutes.getInitialPage
};