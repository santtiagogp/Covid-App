import '../models/covid_model.dart';

abstract class CovidRepository {
  Future<CovidResponse> getCovidStats(String country);
}