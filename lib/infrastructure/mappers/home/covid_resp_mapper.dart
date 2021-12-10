import 'package:covid_app/infrastructure/mappers/home/countryinfo_mapper.dart';

import '../../../application/helpers/interfaces/mapper.dart';
import '../../../domain/models/covid_model.dart';

class CovidRespMapper extends Mapper<CovidResponse> {
  @override
  CovidResponse fromMap(Map<String, dynamic> json) => CovidResponse(
    active: json['active'],
    activePerOneMillion: json['activePerOneMillion'],
    cases: json['cases'],
    casesPerOneMillion: json['casesPerOneMillion'],
    continent: json['continent'],
    country: json['country'],
    countryInfo: CountryInfoMapper().fromMap(json['countryInfo']),
    critical: json['critical'],
    criticalPerOneMillion: json['criticalPerOneMillion'].toDouble(),
    deaths: json['deaths'],
    deathsPerOneMillion: json['deathsPerOneMillion'],
    oneCasePerPeople: json['oneCasePerPeople'],
    oneDeathPerPeople: json['oneDeathPerPeople'],
    oneTestPerPeople: json['oneTestPerPeople'],
    population: json['population'],
    recovered: json['recovered'],
    recoveredPerOneMillion: json['recoveredPerOneMillion'],
    tests: json['tests'],
    testsPerOneMillion: json['testsPerOneMillion'],
    todayCases: json['todayCases'],
    todayDeaths: json['todayDeaths'],
    todayRecovered: json['todayRecovered'],
    updated: json['updated']
  );

  @override
  Map<String, dynamic> toMap(CovidResponse data) => throw UnimplementedError();

}