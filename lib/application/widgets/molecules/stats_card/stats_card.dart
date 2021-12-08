import 'package:flutter/material.dart';

import '../../../constants/utils/covid_responsive.dart';
import '../../foundations/covid_text.dart';
import '../../tokens/covid_spacing.dart';
import 'stats_card_helper.dart';

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
              color: StatsCardHelper.textColorHelper(type),
              fontWeight: FontWeight.w500
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CovidText.bigText(
              text: data,
              color: StatsCardHelper.textColorHelper(type),
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
        color: StatsCardHelper.backgroundColorHelper(type),
        borderRadius: BorderRadius.circular(CovidSpacing.SPACE_MD)
      ),
    );
  }
}