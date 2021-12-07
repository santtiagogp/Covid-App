import 'package:flutter/material.dart';

import '../constants/covid_colors.dart';
import '../constants/utils/covid_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CovidColors.white,
      ),
      body: Column(
        children: [
          _InformationCard()
        ],
      ),
    );
  }
}

class _InformationCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: _responsive.heightConfig(100.0),
        width: _responsive.widthConfig(340.0),
        decoration: const BoxDecoration(
          color: CovidColors.darkBlue,
        ),
      ),
    );
  }

}