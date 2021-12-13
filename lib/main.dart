import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'application/pages/home/config/home_localizations.dart';
import 'application/pages/home/notifiers/country_notifier.dart';
import 'application/routes/routes.dart';
import 'application/widgets/drawer/config/drawer_localizations.dart';
import 'domain/use_case/covid_usecase.dart';
import 'infrastructure/repository/covid_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeNotifier(CovidDataUseCase(CovidApi())),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          HomePageLocalizations.delegate,
          DrawerLocalizations.delegate
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