import 'package:covid_app/application/routes/home_routes.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomePage.pageName : HomeRoutes.getInitialPage
};