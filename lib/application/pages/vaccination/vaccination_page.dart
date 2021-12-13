import 'package:flutter/material.dart';

import '../../constants/covid_colors.dart';
import '../../routes/drawer.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({
    Key? key,
    required this.language
  }) : super(key: key);

  static const String pageName = 'vaccine';

  final Map<String, dynamic> language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerRoutes.open(context),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: CovidColors.black),
            onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [

          ]
        ),
      ),
    );
  }
}