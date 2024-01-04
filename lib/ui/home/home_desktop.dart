import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/app_decorations.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/cubits/home/home_cubit.dart';
import 'package:portfolio_daudk/main.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';

import '../../config/themes/layout_values.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  double height = 100;
  double width = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final random = Random();

              // Generate a random width and height.
              width = random.nextInt(300).toDouble();
              height = random.nextInt(300).toDouble();
            });
          },
          child: const Icon(CupertinoIcons.staroflife_fill),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        // Check if the browser width is greater than 1200px
                        double containerWidth = constraints.maxWidth > 1200
                            ? 1200 // Limit the width to 1200px
                            : constraints.maxWidth;
                        return Container(
                          width: containerWidth,
                          child: Column(
                            children: [
                              DesktopHeader(),
                              // const HeroSection(),
                              // const ExpertiseSection(),
                              // const ExperienceSection(),
                              const Footer(),
                              Row(
                                children: [
                                  // TweenAnimationBuilder(
                                  //   duration: Duration(seconds: 2),
                                  //   curve: Curves.fastOutSlowIn,
                                  //   tween: Tween<double>(begin: 50, end: 200),
                                  //   builder: (context, double value, child) {
                                  //     return SizedBox(
                                  //       width: width,
                                  //       height: value,
                                  //       child: child,
                                  //     );
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: double.infinity,
                                  //     decoration: BoxDecoration(
                                  //       color: AppColors.primaryColor,
                                  //       borderRadius: AppDeco.appBorderRadius,
                                  //     ),
                                  //   ),
                                  // ),

                                  Gap(20.h),
                                  AnimatedContainer(
                                    width: width,
                                    height: height,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.fastOutSlowIn,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: AppDeco.appBorderRadius,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                alignment: Alignment.center,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              width: state is HomeLoaded
                                  ? state.gatesWidth
                                  : state is HomeInitial
                                      ? state.gatesWidth
                                      : 0,
                              decoration: const BoxDecoration(
                                  color: AppColors.cardGrey,
                                  border: Border(
                                      right: BorderSide(
                                          color: AppColors.primaryColor))),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              width: state is HomeLoaded
                                  ? state.gatesWidth
                                  : state is HomeInitial
                                      ? state.gatesWidth
                                      : 0,
                              decoration: const BoxDecoration(
                                  color: AppColors.cardGrey,
                                  border: Border(
                                      left: BorderSide(
                                          color: AppColors.primaryColor))),
                            )
                          ],
                        ),
                        Center(
                          child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 300),
                            curve: const Interval(0, 1,
                                curve: Curves.fastOutSlowIn),
                            builder: (context, double value, child) {
                              return AnimatedOpacity(
                                opacity: value,
                                duration: const Duration(milliseconds: 300),
                                child: child,
                              );
                            },
                            tween: Tween<double>(begin: 1, end: 0),
                            child: TweenAnimationBuilder(
                              duration: const Duration(milliseconds: 1500),
                              curve: const Interval(0, 1,
                                  curve: Curves.fastOutSlowIn),
                              tween: Tween<Offset>(
                                  begin: const Offset(0, 0),
                                  end: const Offset(0, -100)),
                              builder: (context, Offset value, child) {
                                return Transform.translate(
                                    offset: value, child: child);
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    LayoutValues.cardsInnerSpace),
                                decoration: BoxDecoration(
                                    boxShadow: [],
                                    borderRadius: AppDeco.appBorderRadius,
                                    color: AppColors.bgGrey),
                                child: Text(
                                  'Daud K',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )),
          ],
        ));
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
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
          AnimatedButton(),
          Gap(LayoutValues.widgetYspace),
        ],
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
      child: Column(
        children: [
          Text(
            'Professional\nExperience',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(),
          ),
          Gap(40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExperienceCard(),
              Gap(LayoutValues.cardsOuterXSpace),
              const ExperienceCard(),
            ],
          ),
          Gap(LayoutValues.cardsOuterYSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExperienceCard(),
              Gap(LayoutValues.cardsOuterXSpace),
              const Expanded(
                child: SizedBox(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
                colors: [
                  AppColors.primaryColor,
                  // AppColors.cardGrey,
                  AppColors.primaryColor2
                ]),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Flutter Developer @ Baladi Express',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                'Dec 2022 - Aug 2023',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Gap(LayoutValues.cardsOuterYSpace),
        Container(
          padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
          decoration: const BoxDecoration(color: AppColors.cardGrey),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      autofocus: false,
                      icon: const Icon(CupertinoIcons.map_pin_ellipse),
                      label: const Text('Peshawar, Pakistan')),
                  Gap(LayoutValues.appXSpace),
                  TextButton.icon(
                      onPressed: () {},
                      autofocus: false,
                      icon: const Icon(CupertinoIcons.link),
                      label: const Text('sample.com'))
                ],
              ),
              Gap(LayoutValues.cardsOuterYSpace),
              const Text(
                  'As a Flutter Developer, I developed and maintained Flutter applications, emphasizing API integration, error handling, and code reusability. My work led to improved client satisfaction and exceeded customer expectations. I collaborated with cross-functional teams, including designers and quality engineers, and proactively enhanced my product knowledge through self-guided learning and courses.'),
              Gap(LayoutValues.cardsOuterYSpace),
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: AppDeco.appBorderRadius,
                            color: AppColors.bgGrey),
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                          child: Text(
                            'Flutter',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(height: -0.1),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

// class ExperienceSection extends StatefulWidget {
//   const ExperienceSection({super.key});

//   @override
//   State<ExperienceSection> createState() => _ExperienceSectionState();
// }

// class _ExperienceSectionState extends State<ExperienceSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Professional\nExperience',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.displayMedium!.copyWith(),
//           ),
//           Gap(20.h),
//           MouseRegion(
//             cursor: SystemMouseCursors.grab,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     decoration:
//                         const BoxDecoration(color: AppColors.primaryColor2),
//                     margin: EdgeInsets.all(LayoutValues.cardsOuterXSpace),
//                     padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
//                     child: Text('hello World'),
//                   ),

//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Expertise',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(40.h),
          Table(
            border: TableBorder.all(color: AppColors.bgGrey, width: 5),
            children: const [
              TableRow(
                decoration: BoxDecoration(color: AppColors.cardGrey),
                children: [
                  TextCell('Flutter Dev', 'Android, iOS',
                      'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.'),
                  TextCell('No-Code Tools', 'WordPress, Framer, Webflow',
                      'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.'),
                  // TextCell('Flutter Dev', 'Android, iOS',
                  //     'Skilled in developing hybrid mobile apps and cross-platform solutions using the Flutter framework.'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TextCell extends StatelessWidget {
  final String text;
  final String subtext;
  final String description;

  const TextCell(this.text, this.subtext, this.description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    CupertinoIcons.wand_stars_inverse,
                    size: 30.r,
                  ),
                ),
                Gap(5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 10.h,
                            color: AppColors.primaryColor2,
                          ),
                          Text(
                            text,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(),
                          ),
                        ],
                      ),
                      Text(
                        subtext,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(),
                      ),
                      Gap(10.h),
                      Text(description),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
      child: Column(
        children: [
          MouseRegion(
            onEnter: (event) {},
            onExit: (event) {},
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.cardGrey,
                  borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
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
                  Gap(2.w),
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
