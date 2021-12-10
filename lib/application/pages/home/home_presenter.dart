import '../../../domain/models/covid_model.dart';
import '../../../domain/use_case/covid_usecase.dart';

class HomePresenter {
  HomePresenter(this._useCase);

  final CovidDataUseCase _useCase;

  Future<CovidResponse> getCovidData(String country) async {
    final resp = await _useCase.getCovidData(country);

    print(resp);

    return resp;
  }
}