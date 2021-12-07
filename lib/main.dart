import 'package:covid_app/application/pages/home/config/home_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        HomePageLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      routes: appRoutes,
      initialRoute: 'home',
    );
  }
}