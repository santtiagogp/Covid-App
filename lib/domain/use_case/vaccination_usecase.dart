import '../models/data_chart.dart';
import '../models/global_vaccination.dart';
import '../models/vaccine_info_model.dart';
import '../repository/vaccination_repository.dart';

class VaccDataUseCase {

  VaccDataUseCase(this._vaccinationRepository);

  final VaccinationRepository _vaccinationRepository;

  Future<VaccineInfo> getVaccinesInfo()
    => _vaccinationRepository.getVaccinesInfo();
  
  Future<List<CovidData>> getVaccinationInfo(String country)
    => _vaccinationRepository.getVaccinationInfo(country);

  Future<List<GlobalVaccination>> getGlobalVaccination()
    => _vaccinationRepository.getGlobalVaccination();
}