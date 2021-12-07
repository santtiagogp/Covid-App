import 'package:flutter/material.dart';
import 'mappers/home_mapper.dart';
import 'models/home_model.dart';

import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../widgets/foundations/covid_text.dart';
import '../../widgets/tokens/covid_spacing.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.language }) : super(key: key);

  final Map<String, dynamic> language;

  static const String pageName = 'home';

  @override
  Widget build(BuildContext context) {

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
          _InformationCard(model: _model,)
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
        padding: const EdgeInsets.all(CovidSpacing.SPACE_LG),
        margin: EdgeInsets.symmetric(
          vertical: _responsive.heightConfig(CovidSpacing.SPACE_LG)
        ),
        height: _responsive.heightConfig(150),
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
                width: _responsive.heightConfig(CovidSpacing.SPACE_XXL),
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