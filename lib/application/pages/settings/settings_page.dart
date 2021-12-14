import '../../constants/covid_colors.dart';
import '../../routes/drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  static const String pageName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerRoutes.open(context),
      appBar: AppBar(
        backgroundColor: CovidColors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: CovidColors.black),
            onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
      ),
      body: ListView(),
    );
  }
}