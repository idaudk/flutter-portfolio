import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/constants/constants.dart';
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
          Text(Constants.letsWorkTogether,
              style: isMobile
                  ? Theme.of(context).textTheme.displaySmall
                  : Theme.of(context).textTheme.displayMedium!),
          Gap(LayoutValues.widgetYspace),
          isMobile
              ? const Text(
                  Constants.areYouReady)
              : const Text(
                  Constants.areYouReady2,
                ),
          Gap(LayoutValues.widgetYspace),
          AnimatedButton(
            text: Constants.getInTouch,
            showIcon: isMobile ? false : true,
            onTap: () {
              launchMailClient(Constants.email);
            },
          ),
          Gap(40.h),
          Text('Made by Daud K',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Text('Daud K |  Flutter Developer  | PEW',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(5.h),
          SelectableText(Constants.email,
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Row(
            children: [
              IconButton.outlined(
                onPressed: () {
                  launchNewTabClient(Constants.githubLink);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 20,
                ),
              ),
              const Gap(13),
              IconButton.outlined(
                  onPressed: () {
                    launchNewTabClient(Constants.linkedInLink);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 20,
                  )),
              const Gap(13),

                  IconButton.outlined(
                  onPressed: () {
                    launchNewTabClient(
                        Constants.dribbleLink);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.dribbble,
                    size: 20,
                  )),
              const Gap(13),
              IconButton.outlined(
                  onPressed: () {
                    launchNewTabClient(
                        Constants.spotifyLink);
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
