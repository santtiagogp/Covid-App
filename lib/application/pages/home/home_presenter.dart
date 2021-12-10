import 'package:covid_app/domain/models/covid_model.dart';
import 'package:covid_app/domain/use_case/covid_usecase.dart';

class HomePresenter {
  HomePresenter(this._useCase);

  final CovidDataUseCase _useCase;

  Future<CovidResponse> getCovidData(String country) async {
    CovidResponse data;
    final resp = await _useCase.getCovidData(country);

    return data = resp;
  }
}