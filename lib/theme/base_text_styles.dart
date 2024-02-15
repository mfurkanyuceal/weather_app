import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class BaseTextStyle{
  RegularTextStyles regular = RegularTextStyles();
  BoldTextStyles bold = BoldTextStyles();
}

abstract class BaseWeightType {
  TextStyle get caption1;

  TextStyle get caption2;

  TextStyle get footnote;

  TextStyle get subheadline;

  TextStyle get callout;

  TextStyle get body;

  TextStyle get headline;

  TextStyle get title3;

  TextStyle get title2;

  TextStyle get title1;

  TextStyle get largeTitle;
}

class RegularTextStyles extends BaseWeightType {
  @override
  TextStyle get caption1 => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get caption2 => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get footnote => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get subheadline => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get callout => GoogleFonts.inter(
        fontSize: 21,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get body => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w200,
      );

  @override
  TextStyle get headline => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get title3 => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get title2 => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get title1 => GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get largeTitle => GoogleFonts.inter(
        fontSize: 41,
        fontWeight: FontWeight.w400,
      );
}

class BoldTextStyles extends BaseWeightType {
  @override
  TextStyle get caption2 => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get caption1 => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get footnote => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get subheadline => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get callout => GoogleFonts.inter(
        fontSize: 21,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get body => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get headline => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get title3 => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get title2 => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get title1 => GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get largeTitle => GoogleFonts.inter(
        fontSize: 41,
        fontWeight: FontWeight.w600,
      );
}
