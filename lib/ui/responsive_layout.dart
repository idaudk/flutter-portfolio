import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout(
      {super.key,
      required this.mobileScaffold,
      required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ScreenUtil().screenWidth < 500) {
          return mobileScaffold;
        } else if (ScreenUtil().screenWidth < 1100) {
          // return tabletScaffold;
          return mobileScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
