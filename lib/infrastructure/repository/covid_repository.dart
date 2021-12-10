import '../../domain/models/covid_model.dart';
import '../../domain/repository/covid_repository.dart';
import '../mappers/home/covid_resp_mapper.dart';
import '../resp_api/covid_http_manager.dart';

class CovidApi extends CovidRepository {
  
  CovidApi(){
    _apiManager = CovidHttpManager();
  }

  late CovidHttpManager _apiManager;
  final CovidRespMapper _mapper = CovidRespMapper();

  @override
  Future<CovidResponse> getCovidStats(String country) async {
    final String endpoint = '/v3/covid-19/countries/$country/?strict=true';

    final resp = await _apiManager.get(endpoint);

    final CovidResponse data = _mapper.fromMap(resp);

    return data;

  }

}