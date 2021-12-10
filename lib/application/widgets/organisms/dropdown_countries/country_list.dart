import 'package:flutter/material.dart';

class Countries {
  Countries();

  final List<DropdownMenuItem<String>> _items = List.empty(growable: true);
  final List<String> _countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Burundi',
    'Belgium',
    'Benin',
    'Bonaire',
    'Bulgaria',
    'Bahrain',
    'Belarus',
    'Belize',
    'Bermuda',
    'Bolivia',
    'Brazil',
    'Bhutan',
    'Botswana',
    'Canada',
    'Chile',
    'China',
    'Congo'
  ];

  List<DropdownMenuItem<String>> getCountries() {
    for(var i in _countries) {
      final item = DropdownMenuItem<String>(
        child: Text(i),
        value: i,
      );
      _items.add(item);
    }
    return _items;
  }


}