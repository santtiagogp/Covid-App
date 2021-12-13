import '../models/global_vaccination.dart';
import '../models/vaccine_info_model.dart';
import '../models/vacination_data.dart';

abstract class VaccinationRepository {
  Future<VaccineInfo> getVaccinesInfo();

  Future<VaccinationData> getVaccinationInfo(String country);

  Future<List<GlobalVaccination>> getGlobalVaccination();
}