import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/ui/widgets/header/menu_item.dart';

import '../../../config/themes/themes.dart';

class DesktopHeader extends SliverPersistentHeaderDelegate {
  ScrollController scrollController;
  GlobalKey expertiseKey;
  GlobalKey homeKey;
  GlobalKey workKey;
  GlobalKey contactKey;
  GlobalKey experienceKey;
  BuildContext context;

  DesktopHeader(
      {required this.scrollController,
      required this.expertiseKey,
      required this.workKey,
      required this.homeKey,
      required this.contactKey,
      required this.experienceKey,
      required this.context});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Replace this with your actual content
    return ClipRect(
        child: Container(
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30,
          sigmaY: 30,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if the browser width is greater than 1200px
            double containerWidth = constraints.maxWidth > 1200
                ? 1200 // Limit the width to 1200px
                : constraints.maxWidth;
            return Container(
              width: containerWidth,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daud K._',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuItem(
                          onTap: () {
                            scrollToSectionDesktop(homeKey);
                          },
                          number: '01',
                          title: 'home'),
                      Gap(LayoutValues.appXSpace),
                      MenuItem(
                          onTap: () {
                            scrollToSectionDesktop(expertiseKey);
                          },
                          number: '02',
                          title: 'expertise'),
                      Gap(LayoutValues.appXSpace),
                      MenuItem(
                          number: '03',
                          title: 'work',
                          onTap: () {
                            scrollToSectionDesktop(workKey);
                          }),
                      Gap(LayoutValues.appXSpace),
                      MenuItem(
                          onTap: () {
                            scrollToSectionDesktop(experienceKey);
                          },
                          number: '04',
                          title: 'experience'),
                      Gap(LayoutValues.appXSpace),
                      MenuItem(
                          onTap: () {
                            scrollToSectionDesktop(contactKey);
                          },
                          number: '05',
                          title: 'contact'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
