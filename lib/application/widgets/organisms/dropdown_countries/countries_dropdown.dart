import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../pages/home/notifiers/country_notifier.dart';
import 'country_list.dart';

class DropDownCountries extends StatefulWidget {

  DropDownCountries({ Key? key }) : super(key: key);

  @override
  State<DropDownCountries> createState() => _DropDownCountriesState();
}

class _DropDownCountriesState extends State<DropDownCountries> {

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<HomeNotifier>(context);
    return DropdownButton(
      value: _provider.country,
      items: Countries().getCountries(),
      onChanged: (String? opt) {
        _provider.setCountry = opt.toString();
        context.read<HomeNotifier>().getAllData(_provider.country);
      },
    );
  }
}