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
    String? selectedOpt = _provider.country;
    return DropdownButton(
      value: selectedOpt,
      items: Countries().getCountries(),
      onChanged: (String? opt) {
        selectedOpt = opt;
        _provider.setCountry = selectedOpt;
      },
    );
  }
}