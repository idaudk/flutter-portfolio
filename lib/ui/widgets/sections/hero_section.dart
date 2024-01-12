import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:portfolio_daudk/ui/widgets/translation.dart';

import '../../../config/themes/themes.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          onEnter: (event) {},
          onExit: (event) {},
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.cardGrey,
                borderRadius: BorderRadius.circular(20.r)),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
        Text(
          'Daud K',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        // .roll(
        //   'Daud k',

        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        //   tapeCurve: Curves.easeInOutQuart,
        //   // tapeSlideDirection: TapeSlideDirection.down,
        //   // staggerTapes: true,
        //   // staggerSoftness: 6,
        //   // reverseStaggerDirection: true,
        // )
        // .oneShot(
        //     duration: const Duration(milliseconds: 900),
        //     repeat: 100,
        //     curve: Curves.easeOutQuart),
        Text(
          'SOFTWARE ENGINEER, FLUTTER DEVELOPER.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
