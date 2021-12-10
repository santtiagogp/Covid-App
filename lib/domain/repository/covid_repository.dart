import '../models/covid_model.dart';
import '../models/data_chart.dart';

abstract class CovidRepository {
  Future<CovidResponse> getCovidStats(String country);

  Future<List<CovidData>> getHistoricalStats(String country);
}