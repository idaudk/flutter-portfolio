import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

class SectionWidget extends StatelessWidget {
  Widget child;
  List<Color> colors;
  double? height;
  SectionWidget(
      {this.colors = const [],
      required this.child,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? LayoutValues.mobileContainerYSpace
              : LayoutValues.containerYSpace,
          horizontal: isMobile ? 12.w : 0),
      decoration: BoxDecoration(
          gradient: colors.isEmpty
              ? null
              : LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the browser width is greater than 1200px
          double containerWidth = constraints.maxWidth > 1200
              ? 1200 // Limit the width to 1200px
              : constraints.maxWidth;
          return SizedBox(
            width: containerWidth,
            child: child,
          );
        },
      ),
    );
  }
}
