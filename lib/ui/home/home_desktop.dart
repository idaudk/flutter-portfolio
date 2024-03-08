import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/bloc/home_cubit/home_cubit.dart';
import 'package:portfolio_daudk/ui/widgets/header/desktop_header.dart';
import 'package:portfolio_daudk/ui/widgets/hero_slider.dart';
import 'package:portfolio_daudk/ui/widgets/section_widget.dart';
import 'package:portfolio_daudk/ui/widgets/sections/sections.dart';

import '../../config/themes/themes.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen>
    with SingleTickerProviderStateMixin {
  var home = GlobalKey();
  var expertise = GlobalKey();
  var work = GlobalKey();
  var experience = GlobalKey();
  var contact = GlobalKey();

  late ScrollController _scrollController;
  late ScrollController _textScrollController;
  // late AnimationController _animationController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _textScrollController = ScrollController();

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // )..addListener(() {
    //     setState(() {});
    //   });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textScrollController.dispose();
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
            //menu
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
            //hero section
            SliverToBoxAdapter(
              key: home,
              child: const SectionWidget(
                removeVerticalPadding: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: HeroSection()),
                    Expanded(
                      child: FirstSlider(),
                    ),
                    Gap(15),
                    Expanded(
                      child: SecondSlider(),
                    )
                  ],
                ),
              ),
            ),
            //about section
            const SliverToBoxAdapter(
              child: SectionWidget(
                  colors: [AppColors.cardGrey, AppColors.cardGrey],
                  child: AboutSection()),
            ),
            //expertise section
            SliverToBoxAdapter(
              key: expertise,
              child: const SectionWidget(
                child: ExpertiseSection(),
              ),
            ),
            //work section
            SliverToBoxAdapter(
              key: work,
              child: const SectionWidget(child: WorkSection()),
            ),
            //experience section
            SliverToBoxAdapter(
              key: experience,
              child: const SectionWidget(child: ExperienceSection()),
            ),
            //footer
            SliverToBoxAdapter(
              key: contact,
              child: const SectionWidget(
                  colors: [AppColors.cardGrey, AppColors.cardGrey],
                  child: Footer()),
            ),
          ],
        ),

        // opening animation
        // AnimatedGates(),
      ],
    ));
  }
}

class TextSlider extends StatefulWidget {
  final bool isSecond;
  const TextSlider({
    this.isSecond = false,
    super.key,
  });

  @override
  State<TextSlider> createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> with TickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curve;
  late Animation<double> offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.linear);

    offset = Tween<double>(begin: 0, end: widget.isSecond ? 500 : -500)
        .animate(_curve);

    // If you want to start the animation automatically, uncomment the next line
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // double offset = _controller.value * 2.0;
    return Transform.scale(
      scale: 3,
      child: Transform.rotate(
        angle: widget.isSecond ? math.pi / 24.0 : -math.pi / 24.0,
        // angle: 0,
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(color: AppColors.cardGrey),
          // padding: EdgeInsets.symmetric(vertical: LayoutValues.cardsInnerSpace),
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount:
                2, // You can adjust the itemCount based on your text length
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(offset.value, 0),
                    child: child,
                  );
                },
                child: Text(
                  'Flutter  WordPress  Framer  Wix  WebFlow  Flutter  WordPress  Framer  Wix  WebFlow  Flutter  WordPress  Framer  Wix  WebFlow  Flutter  WordPress  Framer  Wix  WebFlow',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      height: 0, color: AppColors.bgGrey, fontSize: 40),
                ),
              );
            },
          ),
        ),
      ),
    );
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
