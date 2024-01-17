import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';

import '../../../config/themes/themes.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lets work together!',
              style: isMobile
                  ? Theme.of(context).textTheme.displaySmall
                  : Theme.of(context).textTheme.displayMedium!),
          Gap(LayoutValues.widgetYspace),
          isMobile
              ? const Text(
                  'Are you ready to take your brand to new heights? Let\'s have a quick chat to discuss your needs and how I can best help your brand reach its full potential.')
              : const Text(
                  'Are you ready to take your brand to new heights? Let\'s have a quick chat to\ndiscuss your needs and how I can best help your brand reach its full potential.',
                ),
          Gap(LayoutValues.widgetYspace),
          AnimatedButton(
            text: 'Get in Touch',
            showIcon: isMobile ? false : true,
            onTap: () {
              launchMailClient('imdaudk@gmail.com');
            },
          ),
          Gap(40.h),
          Text('Made by Daud K',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Text('Daud K |  Flutter Developer  | PEW',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(5.h),
          SelectableText('imdaudk@gmail.com',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Row(
            children: [
              IconButton.outlined(
                onPressed: () {
                  // https://github.com/idaudk
                  launchNewTabClient('https://github.com/idaudk');
                },
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 20,
                ),
              ),
              const Gap(13),
              IconButton.outlined(
                  onPressed: () {
                    launchNewTabClient('https://www.linkedin.com/in/idaudk/');
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 20,
                  )),
              const Gap(13),
              IconButton.outlined(
                  onPressed: () {
                    launchNewTabClient(
                        'https://open.spotify.com/playlist/4Dl4dlMI2LeSw21zKnr7E6?si=de85e30fe95d4c91');
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.spotify,
                    size: 20,
                  )),
            ],
          ),
          Gap(20.h),
          Text('Build with Flutter',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(5.h),
          Text('Thanks for stopping by ッ',
              style: Theme.of(context).textTheme.labelMedium)

          // Text('Made in  🇵🇰', style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
