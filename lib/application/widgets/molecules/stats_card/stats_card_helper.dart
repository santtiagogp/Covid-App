import 'package:flutter/material.dart';

import '../../../constants/covid_colors.dart';
import 'stats_card.dart';

class StatsCardHelper {

  StatsCardHelper._();

  static Color backgroundColorHelper( StatsCardType type ) {
    Color _color;
    switch (type) {
      case StatsCardType.active:
        _color = CovidColors.blue;
        return _color;
      case StatsCardType.confirmed:
        _color = CovidColors.red;
        return _color;
      case StatsCardType.deceased:
        _color = CovidColors.gray;
        return _color;
      case StatsCardType.recovered:
        _color = CovidColors.green;
        return _color;
    }
  }

  static Color textColorHelper( StatsCardType type ) {
    Color _color;
    switch (type) {
      case StatsCardType.confirmed:
        _color = CovidColors.darkRed;
        return _color;
      case StatsCardType.active:
        _color = CovidColors.accentBlue;
        return _color;
      case StatsCardType.recovered:
        _color = CovidColors.darkGreen;
        return _color;
      case StatsCardType.deceased:
        _color = CovidColors.darkGray;
        return _color;
    }
  }

}