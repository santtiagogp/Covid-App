import 'package:flutter/material.dart';

class CountryNotifier with ChangeNotifier {
  String? _countryName = 'Andorra';

  String? get country => _countryName;
  set setCountry(String? name) {
    _countryName = name;
    notifyListeners();
  }
}