import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/app_decorations.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/data/models/experience_model.dart';
import 'package:portfolio_daudk/data/models/expertise_model.dart';
import 'package:portfolio_daudk/data/models/work_model.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';
import 'package:portfolio_daudk/ui/widgets/section_widget.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:hyper_effects/hyper_effects.dart';

import '../../config/themes/layout_values.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  double size = 20;
  double width = 100;
  var align = Alignment.centerRight;
  int colorIndex = 0;
  List color = [
    Colors.pink,
    Colors.blue,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.amber
  ];

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.staroflife_fill),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              shrinkWrap: true,
              slivers: [
                SliverPersistentHeader(
                    floating: true, pinned: true, delegate: DesktopHeader()),
                SliverToBoxAdapter(
                  child: SectionWidget(child: const HeroSection()),
                ),
                SliverToBoxAdapter(
                  child: SectionWidget(child: const ExpertiseSection()),
                ),
                SliverToBoxAdapter(
                  child: SectionWidget(child: const WorkSection()),
                ),
                SliverToBoxAdapter(
                  child: SectionWidget(child: const ExperienceSection()),
                ),
                SliverToBoxAdapter(
                  child: SectionWidget(
                      colors: const [AppColors.cardGrey, AppColors.cardGrey],
                      child: const Footer()),
                )
              ],
            ),

            //opening animation
            // Container(
            //     width: ScreenUtil().screenWidth,
            //     height: ScreenUtil().screenHeight,
            //     alignment: Alignment.center,
            //     child: BlocBuilder<HomeCubit, HomeState>(
            //       builder: (context, state) {
            //         return Stack(
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 AnimatedContainer(
            //                   duration: const Duration(milliseconds: 300),
            //                   curve: Curves.fastOutSlowIn,
            //                   width: state is HomeLoaded
            //                       ? state.gatesWidth
            //                       : state is HomeInitial
            //                           ? state.gatesWidth
            //                           : 0,
            //                   decoration: const BoxDecoration(
            //                       color: AppColors.cardGrey,
            //                       border: Border(
            //                           right: BorderSide(
            //                               color: AppColors.primaryColor))),
            //                 ),
            //                 AnimatedContainer(
            //                   duration: const Duration(milliseconds: 300),
            //                   curve: Curves.fastOutSlowIn,
            //                   width: state is HomeLoaded
            //                       ? state.gatesWidth
            //                       : state is HomeInitial
            //                           ? state.gatesWidth
            //                           : 0,
            //                   decoration: const BoxDecoration(
            //                       color: AppColors.cardGrey,
            //                       border: Border(
            //                           left: BorderSide(
            //                               color: AppColors.primaryColor))),
            //                 )
            //               ],
            //             ),
            //             Center(
            //               child: TweenAnimationBuilder(
            //                 duration: const Duration(milliseconds: 300),
            //                 curve: const Interval(0, 1,
            //                     curve: Curves.fastOutSlowIn),
            //                 builder: (context, double value, child) {
            //                   return AnimatedOpacity(
            //                     opacity: value,
            //                     duration: const Duration(milliseconds: 300),
            //                     child: child,
            //                   );
            //                 },
            //                 tween: Tween<double>(begin: 1, end: 0),
            //                 child: TweenAnimationBuilder(
            //                   duration: const Duration(milliseconds: 1500),
            //                   curve: const Interval(0, 1,
            //                       curve: Curves.fastOutSlowIn),
            //                   tween: Tween<Offset>(
            //                       begin: const Offset(0, 0),
            //                       end: const Offset(0, -100)),
            //                   builder: (context, Offset value, child) {
            //                     return Transform.translate(
            //                         offset: value, child: child);
            //                   },
            //                   child: Container(
            //                     padding: EdgeInsets.all(
            //                         LayoutValues.cardsInnerSpace),
            //                     decoration: BoxDecoration(
            //                         boxShadow: [],
            //                         borderRadius: AppDeco.appBorderRadius,
            //                         color: AppColors.bgGrey),
            //                     child: Text(
            //                       'Daud K',
            //                       style:
            //                           Theme.of(context).textTheme.displaySmall,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             )
            //           ],
            //         );
            //       },
            //     )),
          ],
        ));
  }
}

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: <Color>[
                AppColors.primaryColor,
                Colors.amberAccent,
                Colors.pinkAccent,
                AppColors.primaryColor2
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            'My Work',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        )),
        Gap(LayoutValues.widgetYspace),
        StaggeredGrid.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(workList.length, (index) {
            return Container(
                padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
                decoration: const BoxDecoration(
                  color: AppColors.cardGrey,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            UnderlineText(
                              text: workList[index].title,
                            ),
                            Gap(LayoutValues.cardsInnerSpace),
                            Text(workList[index].description),
                          ],
                        )),
                    Expanded(
                        child: Wrap(
                      direction: Axis.vertical,
                      spacing: LayoutValues.cardsOuterYSpace,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      runSpacing: 20,
                      runAlignment: WrapAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.link)),
                        IconButton.outlined(
                            onPressed: () {}, icon: const Icon(Icons.android)),
                        IconButton.outlined(
                            onPressed: () {}, icon: const Icon(Icons.apple))
                      ],
                    )),
                  ],
                ));
          }),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

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
          const AnimatedButton(),
          Gap(40.h),
          Text('Made by Daud K',
              style: Theme.of(context).textTheme.labelMedium),
          Gap(20.h),
          Text('Daud K |  Flutter Developer  | PEW',
              style: Theme.of(context).textTheme.labelMedium),
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

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Professional\nExperience',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(),
        ),
        Gap(40.h),
        StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          children: List.generate(experienceList.length, (index) {
            return ExperienceCard(experienceList[index]);
          }),
        )
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  Experience _experience;
  ExperienceCard(this._experience, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  _experience.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                _experience.date,
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
                      label: Text(_experience.location)),
                  Gap(LayoutValues.appXSpace),
                  TextButton.icon(
                      onPressed: () {},
                      autofocus: false,
                      icon: const Icon(CupertinoIcons.link),
                      label: Text(_experience.link))
                ],
              ),
              Gap(LayoutValues.cardsOuterYSpace),
              Text(
                _experience.description,
              ),
              Gap(LayoutValues.cardsOuterYSpace + 10),
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
    );
  }
}

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Expertise',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Gap(40.h),
        StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          children: List.generate(expertiseList.length, (index) {
            return TextCell(
              title: expertiseList[index].title,
              subtext: expertiseList[index].subTitle,
              description: expertiseList[index].description,
              icon: expertiseList[index].icon,
            );
          }),
        )
      ],
    );
  }
}

class TextCell extends StatelessWidget {
  final String title;
  final String subtext;
  final String description;
  final IconData icon;

  TextCell(
      {required this.title,
      required this.subtext,
      required this.description,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.cardGrey,
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
                    icon,
                    size: 30.r,
                  ),
                ),
                Gap(5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnderlineText(text: title),
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

class UnderlineText extends StatelessWidget {
  const UnderlineText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: AppDeco.appBorderRadius,
            gradient: const LinearGradient(colors: [
              AppColors.primaryColor,
              Colors.pinkAccent,
              AppColors.primaryColor2
            ]),
          ),
          width: double.infinity,
          height: 10.h,
        ),
        Text(
          text,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          'Daud',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'SOFTWARE ENGINEER, FLUTTER DEVELOPER.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class DesktopHeader extends SliverPersistentHeaderDelegate {
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
