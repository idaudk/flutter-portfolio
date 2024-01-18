import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

class MenuItem extends StatelessWidget {
  final String number;
  final String title;
  final Function() onTap;
  final bool alignLeft;
  const MenuItem({
    required this.number,
    required this.title,
    required this.onTap,
    this.alignLeft = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return InkWell(
      onTap: onTap,
      splashFactory: isMobile ? NoSplash.splashFactory : null,
      splashColor: isMobile ? Colors.transparent : null,
      hoverColor: isMobile ? Colors.transparent : null,
      focusColor: isMobile ? Colors.transparent : null,
      highlightColor: isMobile ? Colors.transparent : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            number,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w700, height: 0),
          ),
          Text(
            '/ / $title',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
