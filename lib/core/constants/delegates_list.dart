import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../application/pages/home/config/home_localizations.dart';
import '../../application/pages/settings/config/setting_localizations.dart';
import '../../application/pages/vaccination/config/vacc_locallizations.dart';
import '../../application/widgets/drawer/config/drawer_localizations.dart';

final List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  HomePageLocalizations.delegate,
  DrawerLocalizations.delegate,
  VaccPageLocalizations.delegate,
  SettingsPageLocalizations.delegate
];