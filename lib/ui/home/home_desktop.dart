import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../config/themes/layout_values.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _pageIndex = 0;

    return Scaffold(
        body: Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          color: Colors.white, // Background color for illustration purposes
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Check if the browser width is greater than 1200px
              double containerWidth = constraints.maxWidth > 1200
                  ? 1200 // Limit the width to 1200px
                  : constraints.maxWidth;

              return Container(
                color: Colors.white,
                // padding: EdgeInsets.symmetric(
                //     horizontal: LayoutValues.scaffoldHorizontalSpace),
                width: containerWidth,
                child: Column(
                  children: [
                    DesktopHeader(),
                    const HeroSection(),
                    ExpertiseSection()
                  ],
                ), // Replace with your actual content
              );
            },
          ),
        ),
      ],
    ));
  }
}

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerXSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Expertise',
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerXSpace),
      child: Column(
        children: [
          Text(
            'Daud Khan',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'SOFTWARE ENGINEER, FLUTTER DEVELOPER.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class DesktopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your actual content
    return Container(
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
              MenuItem(number: '01', title: 'home'),
              Gap(LayoutValues.appXSpace),
              MenuItem(number: '02', title: 'expertise'),
              Gap(LayoutValues.appXSpace),
              MenuItem(number: '03', title: 'work'),
              Gap(LayoutValues.appXSpace),
              MenuItem(number: '04', title: 'experience'),
              Gap(LayoutValues.appXSpace),
              MenuItem(number: '05', title: 'contact'),
            ],
          ),
        ],
      ),
    );
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
