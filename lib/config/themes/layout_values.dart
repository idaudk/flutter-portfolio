import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class LayoutValues {
  //scafold spacing
  static double scaffoldHorizontalSpace = 10;
  static double scaffoldVerticalSpace = 10.h;

  //genernal spacing
  static double appXSpace = 10.w;
  static double appYSpace = 10.h;

  //container or sections
  static double containerYSpace = 100.h;

  //cards
  static double cardsInnerSpace = 30.r;
  static double cardsOuterYSpace = 10.h;
  static double cardsOuterXSpace = 10.h;

  // section internal widgets Y spacing
  static double widgetYspace = 30.h;
}
