import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/use_case/covid_usecase.dart';
import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../routes/drawer.dart';
import '../../widgets/foundations/covid_text.dart';
import '../../widgets/molecules/chart/covid_chart.dart';
import '../../widgets/molecules/info_card/info_card.dart';
import '../../widgets/molecules/loading/loading_indicator.dart';
import '../../widgets/molecules/stats_card/stats_card.dart';
import '../../widgets/organisms/dropdown_countries/countries_dropdown.dart';
import '../../widgets/tokens/covid_spacing.dart';
import 'mappers/home_mapper.dart';
import 'models/home_model.dart';
import 'notifiers/country_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    Key? key,
    required this.language,
    required this.useCase
  }) : super(key: key);

  static const String pageName = 'home';

  final Map<String, dynamic> language;
  final CovidDataUseCase useCase;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{

  late final HomeMapper _mapper;
  late HomeModel _model;
  late CovidResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _mapper = HomeMapper();
    _model = _mapper.fromMap(widget.language);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final country = context.read<HomeNotifier>().country;
      context.read<HomeNotifier>().getAllData(country);
    });
  }

  @override
  Widget build(BuildContext context) {
    _responsive = CovidResponsive(context);
    return Scaffold(
      drawer: DrawerRoutes.open(context),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: CovidColors.black),
            onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
        backgroundColor: CovidColors.white,
        elevation: 0,
        actions: [
          Consumer<HomeNotifier>(builder: (_, value, __) {

            if(value.countryImage.isNotEmpty) {
              return Container(
                margin: const EdgeInsets.all(CovidSpacing.SPACE_MD),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: _responsive.heightConfig(30),
                  width: _responsive.heightConfig(40),
                  placeholder: const AssetImage('assets/img/loading_gif.gif',),
                  image: NetworkImage(value.countryImage),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          DropDownCountries(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InformationCard(title: _model.informationCard,),
            Consumer<HomeNotifier>(builder: (context, value, child) {
              if(value.loading) {
                return const LoadingIndicator();
              }

              if(value.cases != null && value.recovered != null
                && value.deceased != null && value.active != null) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          StatsCard(
                            type: StatsCardType.confirmed,
                            title: _model.confirmed,
                            data: '${value.cases}',
                          ),
                          StatsCard(
                            type: StatsCardType.active,
                            title: _model.active,
                            data: '${value.active}'
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
                            data: '${value.recovered}'
                          ),
                          StatsCard(
                            type: StatsCardType.deceased,
                            title: _model.deceased,
                            data: '${value.deceased}'
                          )
                        ],
                      ),
                    ],
                );
                } else {
                  return const SizedBox.shrink();
                }
            }),
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
            Consumer<HomeNotifier>(builder: (_, value, __) {
              if(value.loading) {
                return const LoadingIndicator();
              }

              if(value.covidDataList.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.all(CovidSpacing.SPACE_LG),
                  height: _responsive.heightConfig(250),
                  width: _responsive.widthConfig(400),
                  child: CovidChart(
                    arrayLength: value.covidDataList.length ,
                    xValueMapper: (int i) => value.covidDataList[i].date,
                    yValueMapper: (int i) => value.covidDataList[i].cases
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            } )
          ],
        ),
      ),
    );
  }
}