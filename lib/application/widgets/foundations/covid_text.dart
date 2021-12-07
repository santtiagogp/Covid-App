import 'package:covid_app/application/widgets/tokens/covid_spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CovidText {
  CovidText._();

  static Text smallText({
    required String text,
    Color? color,
    FontWeight? fontWeight
  }) => Text(text, style: GoogleFonts.rubik(
    color: color,
    fontWeight: fontWeight,
    fontSize: CovidSpacing.SPACE_SL
  ),);

  static Text mediumText({
    required String text,
    Color? color,
    FontWeight? fontWeight
  }) => Text(text, style: GoogleFonts.rubik(
    color: color,
    fontWeight: fontWeight,
    fontSize: CovidSpacing.SPACE_MD
  ),);

  static Text bigText({
    required String text,
    Color? color,
    FontWeight? fontWeight
  }) => Text(text, style: GoogleFonts.rubik(
    color: color,
    fontWeight: fontWeight,
    fontSize: CovidSpacing.SPACE_LG
  ),);

}