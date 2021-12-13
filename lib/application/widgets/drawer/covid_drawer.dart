import 'package:covid_app/application/widgets/foundations/covid_text.dart';

import 'models/drawer_model.dart';
import 'package:flutter/material.dart';

import 'mappers/drawer_mapper.dart';

class CovidDrawer extends StatelessWidget {
  const CovidDrawer({
    Key? key,
    required this.language
  }) : super(key: key);

  final Map<String, dynamic> language;

  @override
  Widget build(BuildContext context) {

    DrawerMapper _mapper = DrawerMapper();
    DrawerModel _model = _mapper.fromMap(language);

    return Drawer(
      child: ListView.separated(
        itemBuilder: (context, i) {
          return ListTile(
            title: CovidText.smallText(text: _model.options[i].title),
            onTap: () => Navigator.pushNamed(context, _model.options[i].route),
          );
        },
        separatorBuilder: (_, i) => const Divider(),
        itemCount: _model.options.length
      )
    );
  }
}