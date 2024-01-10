import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';

import '../../../config/themes/themes.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lets work together!',
              style: Theme.of(context).textTheme.displayMedium!),
          Gap(LayoutValues.widgetYspace),
          const Text(
            'Are you ready to take your brand to new heights? Let\'s have a quick chat to\ndiscuss your needs and how I can best help your brand reach its full potential.',
          ),
          Gap(LayoutValues.widgetYspace),
          AnimatedButton(
              text: 'Schedule a free consultation',
              icon: CupertinoIcons.arrow_right),
          Gap(40.h),
          Text('Made by Daud K',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          // Text('Thanks for stopping by ッ')
          Text('Daud K |  Flutter Developer  | PEW',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(5.h),

          Text('imdaudk@gmail.com',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Row(
            children: [
              IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.checkmark_alt_circle)),
              Gap(2.w),
              IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.checkmark_alt_circle)),
              Gap(2.w),
              IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.checkmark_alt_circle)),
            ],
          )
        ],
      ),
    );
  }
}