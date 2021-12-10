import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/covid_model.dart';
import '../../../domain/models/data_chart.dart';
import '../../../domain/use_case/covid_usecase.dart';
import '../../../infrastructure/notifiers/country_notifier.dart';
import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../widgets/foundations/covid_text.dart';
import '../../widgets/molecules/chart/covid_chart.dart';
import '../../widgets/molecules/info_card/info_card.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            InformationCard(model: _model,),
            FutureBuilder(
              future: _presenter.getCovidData(_provider.country.toString()),
              builder: (BuildContext context,
                AsyncSnapshot<CovidResponse> snapshot) {
              
              if(snapshot.hasData) {
                return Column(
                children: [
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
                  SizedBox(
                    height: _responsive.heightConfig(CovidSpacing.SPACE_MD),
                  ),
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
                ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator()
                );
              }
              },
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
            ),
            FutureBuilder(
              future: _presenter.getHistoricalData(_provider.country.toString()),
              builder: (BuildContext context, AsyncSnapshot<List<CovidData>> snapshot) {
                if(snapshot.hasData){
                  return Container(
                    margin: const EdgeInsets.all(CovidSpacing.SPACE_LG),
                    height: _responsive.heightConfig(250),
                    width: _responsive.widthConfig(400),
                    child: CovidChart(
                      arrayLength: snapshot.data!.length,
                      xValueMapper: (int i) => snapshot.data![i].date,
                      yValueMapper: (int i) => snapshot.data![i].cases
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}