import '../../domain/models/global_vaccination.dart';
import '../../domain/models/vaccine_info_model.dart';
import '../../domain/models/vacination_data.dart';
import '../../domain/repository/vaccination_repository.dart';
import '../mappers/vaccination/global_vaccination_mapper.dart';
import '../mappers/vaccination/vacc_info_mapper.dart';
import '../mappers/vaccination/vaccination_data_mapper.dart';
import '../resp_api/covid_http_manager.dart';

class VaccinesApi extends VaccinationRepository {

  VaccinesApi() {
    _apiManager = CovidHttpManager();
  }

  late CovidHttpManager _apiManager;

  @override
  Future<List<GlobalVaccination>> getGlobalVaccination() async{
    const String endpoint
      = '/v3/covid-19/vaccine/coverage?lastdays=30&fullData=true';

    final List<Map<String, dynamic>> resp = await _apiManager.get(endpoint);

    final List<GlobalVaccination> _list = List.empty(growable: true);

    for (Map<String, dynamic> item in resp) {
      final data = GlobalVaccMapper().fromMap(item);

      _list.add(data);
    }

    return _list;

  }

  @override
  Future<VaccinationData> getVaccinationInfo(String country) async{
    final String endpoint =
    '/v3/covid-19/vaccine/coverage/countries/$country?lastdays=30&fullData=false';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final data = VaccDataMapper().fromMap(resp);

    return data;

  }

  @override
  Future<VaccineInfo> getVaccinesInfo() async{
    const String endpoint = '/v3/covid-19/vaccine';

    final Map<String, dynamic> resp = await _apiManager.get(endpoint);

    final VaccineInfo data = VaccInfoMapper().fromMap(resp);

    return data;

  }

}