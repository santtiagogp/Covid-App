import 'package:flutter/material.dart';

import '../pages/settings/settings_page.dart';

class SettingsRoutes {

  SettingsRoutes._();

  static SettingsPage getInitialPage(BuildContext context) {
    return const SettingsPage();
  }
}