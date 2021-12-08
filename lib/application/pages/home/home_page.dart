import 'package:flutter/material.dart';

import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../widgets/foundations/covid_text.dart';
import '../../widgets/molecules/stats_card/stats_card.dart';
import '../../widgets/tokens/covid_spacing.dart';
import 'mappers/home_mapper.dart';
import 'models/home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.language }) : super(key: key);

  final Map<String, dynamic> language;

  static const String pageName = 'home';

  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);

    late HomeModel _model;
    final HomeMapper _mapper = HomeMapper();
    _model = _mapper.fromMap(language);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: CovidColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _InformationCard(model: _model,),
          Row(
            children: [
              StatsCard(
                type: StatsCardType.confirmed,
                title: _model.confirmed,
                data: '109923',
              ),
              StatsCard(
                type: StatsCardType.active,
                title: _model.active,
                data: '3432'
              )
            ],
          ),
          SizedBox(height: _responsive.heightConfig(CovidSpacing.SPACE_MD),),
          Row(
            children: [
              StatsCard(
                type: StatsCardType.recovered,
                title: _model.recovered,
                data: '43232'
              ),
              StatsCard(
                type: StatsCardType.deceased,
                title: _model.deceased,
                data: '50'
              )
            ],
          )
        ],
      ),
    );
  }
}

class _InformationCard extends StatelessWidget {

  _InformationCard({
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