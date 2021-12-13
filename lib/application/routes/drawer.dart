import 'package:flutter/material.dart';

import '../widgets/drawer/config/drawer_localizations.dart';
import '../widgets/drawer/covid_drawer.dart';

class DrawerRoutes {
  static CovidDrawer open(BuildContext context) => CovidDrawer(
    language: DrawerLocalizations.of(context)!.getJsonTranslate(),
  );
}