import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MobileFooterSection extends StatelessWidget {
  const MobileFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Text('Made by Daud K',
                      style: Theme.of(context).textTheme.labelMedium),
                  Gap(20.h),
                  // Text('Thanks for stopping by ッ')
                  Text('Daud K |  Flutter Developer  | PEW',
                      style: Theme.of(context).textTheme.labelMedium),
                  Gap(5.h),

                  Text('imdaudk@gmail.com',
                      style: Theme.of(context).textTheme.labelMedium),
                  Gap(60.h),
                ],
              );
  }
}