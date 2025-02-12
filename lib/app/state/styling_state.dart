import 'dart:ui';

import 'package:get/get.dart';

import '../constants/language.dart';

class StylingState {
  static final StylingState _instance = StylingState._();

  StylingState._();

  factory StylingState() => _instance;

  RxList<Lng> selectedLanguages = RxList.empty();

  ///FONT STYLING
  RxDouble fontSize = RxDouble(28);
  RxString fontFamily = RxString('Verdana');
  Rx<FontWeight> fontWeight = FontWeight.normal.obs;
  RxString fontColor = RxString('303030');

  String fontWeightToString(FontWeight weight) {
    if (weight == FontWeight.normal) {
      return 'Normal';
    }
    if (weight == FontWeight.bold) {
      return 'Bold';
    }

    if (weight == FontWeight.w900) {
      return 'Bas jako bold';
    }

    return 'Normal';
  }

  FontWeight mapStringToFontWeight(String weight) {
    switch (weight) {
      case 'Normal':
        return FontWeight.normal;
      case 'Bold':
        return FontWeight.bold;
      case 'Bas jako bold':
        return FontWeight.w900;
    }
    return FontWeight.normal;
  }
}
