import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/routes/routes.dart';
import 'core/constants/delegates_list.dart';
import 'core/constants/providers_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        localizationsDelegates: localizationsDelegates,
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