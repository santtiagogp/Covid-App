import 'package:flutter/material.dart';

import 'country_list.dart';

class DropDownCountries extends StatefulWidget {

  DropDownCountries({ Key? key }) : super(key: key);

  @override
  State<DropDownCountries> createState() => _DropDownCountriesState();
}

class _DropDownCountriesState extends State<DropDownCountries> {
  
  String? selectedOpt = 'Andorra';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedOpt,
      items: Countries().getCountries(),
      onChanged: (String? opt) => setState(() => selectedOpt = opt),
    );
  }
}