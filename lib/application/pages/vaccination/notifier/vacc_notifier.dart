import 'package:flutter/material.dart';

import '../../../../domain/models/data_chart.dart';
import '../../../../domain/models/global_vaccination.dart';
import '../../../../domain/models/vaccine_info_model.dart';
import '../../../../domain/use_case/vaccination_usecase.dart';

class VaccNotifier with ChangeNotifier {

  VaccNotifier(this._useCase);

  final VaccDataUseCase _useCase;

  String error = '';
  bool _loading = false;
  String _countryName = 'Andorra';
  List<Datum> _vaccinesInfo = [];
  List<GlobalVaccination> _globalVac = [];
  List<CovidData> _chart = [];


  List<CovidData> get chartData => _chart;
  bool get loading => _loading; 
  String get country => _countryName;
  List<Datum> get vaccinesInfo => _vaccinesInfo;
  List<GlobalVaccination> get global => _globalVac;

  set setCountry(String name) {
    _countryName = name;
    notifyListeners();
  }

  void getVaccinesInfo() async {
    try {
      _activateLoading();

      final resp = await _useCase.getVaccinesInfo();

      _vaccinesInfo = resp.data;

      _deactivateLoading();

    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  void getVaccinationInfo(String country) async {
    try {
      _activateLoading();

      final resp = await _useCase.getVaccinationInfo(country);

      _chart = resp;

      _deactivateLoading();
      
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  void getGlobalVaccination() async {
    try {
      _activateLoading();

      final resp = await _useCase.getGlobalVaccination();

      _globalVac = resp;

      _deactivateLoading();
      
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  void getAllData() {
    getGlobalVaccination();
    getVaccinationInfo(country);
    getVaccinesInfo();
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