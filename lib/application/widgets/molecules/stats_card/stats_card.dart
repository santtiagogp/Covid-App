import 'package:covid_app/application/constants/covid_colors.dart';
import 'package:covid_app/application/widgets/foundations/covid_text.dart';

import '../../../constants/utils/covid_responsive.dart';
import '../../tokens/covid_spacing.dart';
import 'package:flutter/material.dart';

enum StatsCardType { confirmed, active, recovered, deceased }

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
    required this.type,
    required this.title,
    required this.data
  }) : super(key: key);

  final StatsCardType type;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);

    return Container(
      padding: EdgeInsets.all(_responsive.heightConfig(CovidSpacing.SPACE_MD)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CovidText.mediumText(
              text: title,
              color: _textColorHelper(),
              fontWeight: FontWeight.w500
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CovidText.bigText(
              text: data,
              color: _textColorHelper(),
              fontWeight: FontWeight.bold
            )
          )
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: _responsive.widthConfig(CovidSpacing.SPACE_MD)
      ),
      width: _responsive.widthConfig(CovidSpacing.SPACE_XXL + 100),
      height: _responsive.heightConfig(CovidSpacing.SPACE_XXL + 80),
      decoration: BoxDecoration(
        color: _backgroundColorHelper(),
        borderRadius: BorderRadius.circular(CovidSpacing.SPACE_MD)
      ),
    );
  }

  Color _backgroundColorHelper() {
    switch (type) {
      case StatsCardType.active:
        return CovidColors.blue;
      case StatsCardType.confirmed:
        return CovidColors.red;
      case StatsCardType.deceased:
        return CovidColors.gray;
      case StatsCardType.recovered:
        return CovidColors.green;
    }
  }

  Color _textColorHelper() {
    Color _color;
    switch (type) {
      case StatsCardType.confirmed:
        _color = CovidColors.darkRed;
        return _color;
      case StatsCardType.active:
        _color = CovidColors.accentBlue;
        return _color;
      case StatsCardType.recovered:
        _color = CovidColors.darkGreen;
        return _color;
      case StatsCardType.deceased:
        _color = CovidColors.darkGray;
        return _color;
    }
  }
}