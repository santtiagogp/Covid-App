import 'package:flutter/material.dart';

import '../../../../domain/models/data_chart.dart';
import '../../../../domain/use_case/covid_usecase.dart';

class HomeNotifier with ChangeNotifier {

  HomeNotifier(this._useCase);
  final CovidDataUseCase _useCase;

  String _error = '';
  bool _loading = false;
  List<CovidData> _covidDataList = [];
  String _countryImageUrl = '';
  String _countryName = 'Andorra';
  int? _cases;
  int? _deceased;
  int? _recovered;
  int? _active;

  String get country => _countryName;
  bool get loading => _loading;
  List<CovidData> get covidDataList => _covidDataList;
  String get countryImage => _countryImageUrl;
  int? get cases => _cases;
  int? get recovered => _recovered;
  int? get deceased => _deceased;
  int? get active => _active;
  String get error => _error;
  

  set setCountry(String name) {
    _countryName = name;
    notifyListeners();
  }

  void getCovidData(String country) async {

    try {
      _activateLoading();

      final resp = await _useCase.getCovidData(country);
      _cases = resp.cases;
      _deceased = resp.deaths;
      _recovered = resp.recovered;
      _active = resp.active;

      _deactivateLoading();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }

  }

  void getHistoricalData(String country) async {

    try {
      _activateLoading();

      final resp = await _useCase.getHistoricalData(country);

      _covidDataList = resp;

      _deactivateLoading();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }    
  }

  void getCountryImage(String country) async {

    try {
      
      _activateLoading();

      final resp = await _useCase.getCovidData(country);

      _countryImageUrl = resp.countryInfo.flag;

      _deactivateLoading();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void getAllData(String country) {
    getCovidData(country);
    getHistoricalData(country);
    getCountryImage(country);
  }

  void _activateLoading() {
    _loading = true;
    notifyListeners();
  }

  void _deactivateLoading() {
    _loading = false;
    notifyListeners();
  }

}