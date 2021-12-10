import '../../../domain/models/covid_model.dart';
import '../../../domain/repository/covid_repository.dart';

class CovidDataUseCase {

  CovidDataUseCase(this._covidRepository);

  final CovidRepository _covidRepository;

  Future<CovidResponse> getCovidData(String country) => 
    _covidRepository.getCovidStats(country);

}