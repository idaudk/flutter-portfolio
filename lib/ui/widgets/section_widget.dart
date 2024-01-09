import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

class SectionWidget extends StatelessWidget {
  Widget child;
  List<Color> colors;
  SectionWidget({this.colors = const [], required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
      decoration: BoxDecoration(
          // border: Border(top: BorderSide(width: 3, color: Colors.yellowAccent)),
          gradient: colors.isEmpty
              ? null
              : LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
      alignment: Alignment.topCenter,
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
