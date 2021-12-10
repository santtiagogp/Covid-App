import 'package:flutter/material.dart';

import '../../../constants/covid_colors.dart';
import '../../../constants/utils/covid_responsive.dart';
import '../../../pages/home/models/home_model.dart';
import '../../foundations/covid_text.dart';
import '../../tokens/covid_spacing.dart';

class InformationCard extends StatelessWidget {

  InformationCard({
    required this.model
  });

  final HomeModel model;

  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(CovidSpacing.SPACE_MD),
        margin: EdgeInsets.symmetric(
          vertical: _responsive.heightConfig(CovidSpacing.SPACE_LG)
        ),
        height: _responsive.heightConfig(160),
        width: _responsive.widthConfig(340.0),
        decoration: BoxDecoration(
          color: CovidColors.darkBlue,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CovidText.bigText(
              text: model.informationCard,
              fontWeight: FontWeight.w600
            ),
            InkWell(
              onTap: (){},
              child: Container(
                child: const Icon(Icons.arrow_forward_outlined,
                color: CovidColors.white),
                height: _responsive.heightConfig(CovidSpacing.SPACE_XL),
                width: _responsive.widthConfig(CovidSpacing.SPACE_XXL),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(CovidSpacing.SPACE_MD)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}