import 'package:flutter/material.dart';

import 'application/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      routes: appRoutes,
      initialRoute: 'home',
    );
  }
}