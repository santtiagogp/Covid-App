import '../../domain/models/covid_model.dart';
import '../../domain/models/data_chart.dart';
import '../../domain/repository/covid_repository.dart';
import '../mappers/home/covid_resp_mapper.dart';
import '../mappers/home/historical_resp_mapper.dart';
import '../resp_api/covid_http_manager.dart';

class CovidApi extends CovidRepository {
  
  CovidApi(){
    _apiManager = CovidHttpManager();
  }

  late CovidHttpManager _apiManager;

  @override
  Future<CovidResponse> getCovidStats(String country) async {
    final String endpoint = '/v3/covid-19/countries/$country/?strict=true';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = CovidRespMapper().fromMap(resp);

    return data;

  }

  @override
  Future<List<CovidData>> getHistoricalStats(String country) async {
    final String endpoint = '/v3/covid-19/historical/$country?lastdays=90';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = HistoricalRespMapper().fromMap(resp);

    final map = data.timeline.cases;

    final List<CovidData> chartData = List.empty(growable: true);

    for(final item in map.entries) {
      chartData.add(CovidData(item.key, item.value));
    }

    return chartData;

  }

}