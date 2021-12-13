import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'application/pages/home/config/home_localizations.dart';
import 'application/pages/home/notifiers/country_notifier.dart';
import 'application/pages/vaccination/config/vacc_locallizations.dart';
import 'application/pages/vaccination/notifier/vacc_notifier.dart';
import 'application/routes/routes.dart';
import 'application/widgets/drawer/config/drawer_localizations.dart';
import 'domain/use_case/covid_usecase.dart';
import 'domain/use_case/vaccination_usecase.dart';
import 'infrastructure/repository/covid_repository.dart';
import 'infrastructure/repository/vaccines_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeNotifier(CovidDataUseCase(CovidApi())),
        ),
        ChangeNotifierProvider(
          create: (_) => VaccNotifier(VaccDataUseCase(VaccinesApi())),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          HomePageLocalizations.delegate,
          DrawerLocalizations.delegate,
          VaccPageLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Covid App',
        routes: appRoutes,
        initialRoute: 'home',
      ),
    );
  }
}