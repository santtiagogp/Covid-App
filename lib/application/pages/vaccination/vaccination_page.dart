import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/covid_colors.dart';
import '../../constants/utils/covid_responsive.dart';
import '../../routes/drawer.dart';
import '../../widgets/molecules/chart/covid_chart.dart';
import '../../widgets/molecules/info_card/info_card.dart';
import '../../widgets/molecules/loading/loading_indicator.dart';
import '../../widgets/molecules/stats_card/stats_card.dart';
import '../../widgets/organisms/dropdown_countries/countries_dropdown.dart';
import '../../widgets/tokens/covid_spacing.dart';
import '../home/notifiers/country_notifier.dart';
import 'mappers/vacc_mapper.dart';
import 'models/vacc_model.dart';
import 'notifier/vacc_notifier.dart';

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({
    Key? key,
    required this.language
  }) : super(key: key);

  static const String pageName = 'vaccine';

  final Map<String, dynamic> language;

  @override
  State<VaccinationPage> createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {

  late VaccModel _model;
  late final VaccMapper _mapper;
  late CovidResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _mapper = VaccMapper();
    _model = _mapper.fromMap(widget.language);
    WidgetsBinding.instance!.addPostFrameCallback((_){
      context.read<VaccNotifier>().getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _responsive = CovidResponsive(context);
    return Scaffold(
      drawer: DrawerRoutes.open(context),
      appBar: AppBar(
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
        backgroundColor: CovidColors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: CovidColors.black),
            onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InformationCard(title: _model.informationCard,),
            Consumer<VaccNotifier>(builder: (_, value, __) {

              if(value.loading) {
                return const LoadingIndicator();
              }

              if(value.global.isNotEmpty) {
                return StatsCard(
                  type: StatsCardType.recovered,
                  title: 'Globally vaccinated',
                  data: value.global[0].toString()
                );
              } else {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  height: 150,
                  width: 150,
                );
              }
            }),
            Consumer<VaccNotifier>(builder: (_, value, __) {
              if(value.loading) {
                return const LoadingIndicator();
              }

              if(value.chartData.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.all(CovidSpacing.SPACE_XL),
                  height: _responsive.heightConfig(250),
                  width: _responsive.widthConfig(400),
                  child: CovidChart(
                    arrayLength: value.chartData.length ,
                    xValueMapper: (int i) => value.chartData[i].date,
                    yValueMapper: (int i) => value.chartData[i].cases
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ]
        ),
      ),
    );
  }
}