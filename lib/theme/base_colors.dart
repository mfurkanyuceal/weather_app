import 'package:flutter/material.dart';

abstract class BaseColors {
  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get quaternary;
}

class LightColors extends BaseColors {
  @override
  Color get primary => const Color(0xFF000000);

  @override
  Color get secondary => const Color(0xFF86878C);

  @override
  Color get tertiary => const Color(0xFFBDBFC3);

  @override
  Color get quaternary => const Color(0xFFD3D5D9);
}

class DarkColors extends BaseColors {
  @override
  Color get primary => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFFA19DB7);

  @override
  Color get tertiary => const Color(0xFF696589);

  @override
  Color get quaternary => const Color(0xFF524E87);
}