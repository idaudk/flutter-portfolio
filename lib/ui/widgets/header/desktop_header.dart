import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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

  // Function to scroll to a specific SliverToBoxAdapter widget based on key
  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        curve: Curves.fastOutSlowIn, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Replace this with your actual content
    return ClipRect(
        child: Container(
      alignment: Alignment.topCenter,
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
                    children: [
                      InkWell(
                          onTap: () => scrollToSection(homeKey),
                          child: MenuItem(number: '01', title: 'home')),
                      Gap(LayoutValues.appXSpace),
                      InkWell(
                          onTap: () => scrollToSection(expertiseKey),
                          child: MenuItem(number: '02', title: 'expertise')),
                      Gap(LayoutValues.appXSpace),
                      InkWell(
                          onTap: () => scrollToSection(workKey),
                          child: MenuItem(number: '03', title: 'work')),
                      Gap(LayoutValues.appXSpace),
                      InkWell(
                          onTap: () => scrollToSection(experienceKey),
                          child: MenuItem(number: '04', title: 'experience')),
                      Gap(LayoutValues.appXSpace),
                      InkWell(
                          onTap: () => scrollToSection(contactKey),
                          child: MenuItem(number: '05', title: 'contact')),
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
  // TODO: implement maxExtent
  double get maxExtent => 80.h;

  @override
  // TODO: implement minExtent
  double get minExtent => 80.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class MenuItem extends StatelessWidget {
  String number;
  String title;
  MenuItem({
    required this.number,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          number,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          '/ / $title',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}