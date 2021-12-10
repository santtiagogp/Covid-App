import '../../../../infrastructure/notifiers/country_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'country_list.dart';

class DropDownCountries extends StatefulWidget {

  DropDownCountries({ Key? key }) : super(key: key);

  @override
  State<DropDownCountries> createState() => _DropDownCountriesState();
}

class _DropDownCountriesState extends State<DropDownCountries> {

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<CountryNotifier>(context);
    return DropdownButton(
      value: _provider.country,
      items: Countries().getCountries(),
      onChanged: (String? opt) {
        _provider.setCountry = opt;
      },
    );
  }
}