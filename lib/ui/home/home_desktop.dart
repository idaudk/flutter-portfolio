import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/app_decorations.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/cubits/home/home_cubit.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';
import 'package:portfolio_daudk/ui/widgets/header/desktop_header.dart';
import 'package:portfolio_daudk/ui/widgets/section_widget.dart';
import 'package:portfolio_daudk/ui/widgets/sections/experience_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/expertise_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/footer_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/hero_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/work_section.dart';
import 'package:portfolio_daudk/ui/widgets/translation.dart';

import '../../config/themes/layout_values.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  var home = GlobalKey();
  var expertise = GlobalKey();
  var work = GlobalKey();
  var experience = GlobalKey();
  var contact = GlobalKey();

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: [
            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: DesktopHeader(
                    context: context,
                    expertiseKey: expertise,
                    contactKey: contact,
                    experienceKey: experience,
                    homeKey: home,
                    workKey: work,
                    scrollController: _scrollController)),
            SliverToBoxAdapter(
              key: home,
              child: SectionWidget(
                  height: ScreenUtil().screenHeight - 80.h,
                  child: const HeroSection()),
            ),
            SliverToBoxAdapter(
              child: SectionWidget(
                  colors: const [AppColors.cardGrey, AppColors.cardGrey],
                  child: Column(
                    children: [
                      const Translation(),
                      Gap(5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: const Text(
                          'I\'m Daud khan, Versatile developer with 3 years of experience across various technologies. Expertise in creating cross-platform mobile applications with a focus on UI/UX design. Skilled in crafting user-friendly websites using Wix and WordPress, ensuring seamless navigation and engaging user experiences. Committed to delivering high-quality, scalable, and visually appealing digital solutions.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gap(30.h),
                      AnimatedButton(
                        text: 'Download CV',
                      ),
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              key: expertise,
              child: SectionWidget(child: ExpertiseSection()),
            ),
            SliverToBoxAdapter(
              key: work,
              child: SectionWidget(child: WorkSection()),
            ),
            SliverToBoxAdapter(
              key: experience,
              child: SectionWidget(child: const ExperienceSection()),
            ),
            SliverToBoxAdapter(
              key: contact,
              child: SectionWidget(
                  colors: const [AppColors.cardGrey, AppColors.cardGrey],
                  child: Footer()),
            )
          ],
        ),

        // opening animation
        // AnimatedGates(),
      ],
    ));
  }
}

class AnimatedGates extends StatelessWidget {
  const AnimatedGates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              right:
                                  BorderSide(color: AppColors.primaryColor))),
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
                              left: BorderSide(color: AppColors.primaryColor))),
                    )
                  ],
                ),
                Center(
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 300),
                    curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
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
                      curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
                      tween: Tween<Offset>(
                          begin: const Offset(0, 0),
                          end: const Offset(0, -100)),
                      builder: (context, Offset value, child) {
                        return Transform.translate(offset: value, child: child);
                      },
                      child: Container(
                        padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
                        decoration: BoxDecoration(
                            boxShadow: [],
                            borderRadius: AppDeco.appBorderRadius,
                            color: AppColors.bgGrey),
                        child: Text(
                          'Daud K',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
