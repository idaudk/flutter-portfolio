import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/themes/themes.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        forWork(),
        Text(
          'Daud K',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'SOFTWARE ENGINEER',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class forWork extends StatelessWidget {
  const forWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cardGrey, borderRadius: BorderRadius.circular(20.r)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 6.r,
            height: 6.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.lightGreen),
          ),
          Gap(3.w),
          Text(
            'Available for work',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.lightGreen),
          ),
        ],
      ),
    );
  }
}
