import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/covid_model.dart';
import '../../../domain/use_case/covid_usecase.dart';
import '../../../infrastructure/notifiers/country_notifier.dart';
import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../widgets/foundations/covid_text.dart';
import '../../widgets/molecules/stats_card/stats_card.dart';
import '../../widgets/organisms/dropdown_countries/countries_dropdown.dart';
import '../../widgets/tokens/covid_spacing.dart';
import 'home_presenter.dart';
import 'mappers/home_mapper.dart';
import 'models/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    Key? key,
    required this.language,
    required this.useCase
  }) : super(key: key);

  final Map<String, dynamic> language;

  static const String pageName = 'home';
  final CovidDataUseCase useCase;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);
    final HomePresenter _presenter = HomePresenter(widget.useCase);
    final _provider = Provider.of<CountryNotifier>(context);

    late HomeModel _model;
    final HomeMapper _mapper = HomeMapper();
    _model = _mapper.fromMap(widget.language);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: CovidColors.white,
        elevation: 0,
        actions: [
          DropDownCountries()
        ],
      ),
      body: FutureBuilder(
        future: _presenter.getCovidData(_provider.country.toString()),
        builder: (BuildContext context, AsyncSnapshot<CovidResponse> snapshot) {
          if(snapshot.hasData){
            return Column(
            children: [
              _InformationCard(model: _model,),
              Row(
                children: [
                  StatsCard(
                    type: StatsCardType.confirmed,
                    title: _model.confirmed,
                    data: '${snapshot.data!.cases}',
                  ),
                  StatsCard(
                    type: StatsCardType.active,
                    title: _model.active,
                    data: '${snapshot.data!.active}'
                  )
                ],
              ),
              SizedBox(height: _responsive.heightConfig(CovidSpacing.SPACE_MD),),
              Row(
                children: [
                  StatsCard(
                    type: StatsCardType.recovered,
                    title: _model.recovered,
                    data: '${snapshot.data!.recovered}'
                  ),
                  StatsCard(
                    type: StatsCardType.deceased,
                    title: _model.deceased,
                    data: '${snapshot.data!.deaths}'
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(
                    _responsive.heightConfig(CovidSpacing.SPACE_LG)
                  ),
                  child: CovidText.mediumText(
                    text: _model.graphic,
                    fontWeight: FontWeight.bold
                  )
                )
              )
            ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: CovidColors.accentBlue,
              ),
            );
          }
        },
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