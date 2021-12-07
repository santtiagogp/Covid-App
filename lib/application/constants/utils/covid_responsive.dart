import 'package:flutter/material.dart';

class CovidResponsive {
  double? _width, _height;

  CovidResponsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if( orientation == Orientation.portrait ) {
      _width = size.width;
      _height = size.height;
    } else {
      _width = size.height;
      _height = size.width;
    }
  }

  double widthConfig(double pixels) {
    double doublePercent = ( pixels * 100.0 ) / 375.0;
    return ( _width! * doublePercent ) / 100;
  }

  double heightConfig(double pixels) {
    double doublePercent = ( pixels * 100.0 ) / 812.0;
    return ( _height! * doublePercent ) / 100;
  }

}