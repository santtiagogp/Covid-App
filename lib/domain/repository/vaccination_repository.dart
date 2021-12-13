import '../models/data_chart.dart';
import '../models/global_vaccination.dart';
import '../models/vaccine_info_model.dart';

abstract class VaccinationRepository {
  Future<VaccineInfo> getVaccinesInfo();

  Future<List<CovidData>> getVaccinationInfo(String country);

  Future<List<GlobalVaccination>> getGlobalVaccination();
}