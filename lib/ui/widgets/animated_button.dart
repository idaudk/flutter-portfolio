import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/app_decorations.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

import '../../config/themes/themes.dart';

class AnimatedButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool showIcon;
  final Function()? onTap;
  const AnimatedButton({
    this.icon = CupertinoIcons.arrow_right,
    required this.text,
    this.showIcon = true,
    this.onTap,
    super.key,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _gradientBegin;
  late Animation _gradientEnd;
  // late Animation _paddingAnimation;
  late Animation _borderAnimation;
  late Animation<double> _rightArrowAnimation;
  late Animation<double> _leftArrowAnimation;
  late var _curve;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    //animation for edgeinsets
    // _paddingAnimation = EdgeInsetsTween(
    //   begin: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 8.w, left: 8.w),
    //   end: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 8.w, left: 8.w),
    // ).animate(_curve);

    //animation for borders
    _borderAnimation = BorderTween(
            begin: Border.all(width: 0),
            end: Border.all(color: AppColors.primaryColor, width: 2))
        .animate(_curve);

    //animation for color
    _colorAnimation =
        ColorTween(begin: AppColors.primaryColor, end: AppColors.primaryColor2)
            .animate(_curve);

    // animation for gradient background
    _gradientBegin = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
        // TweenSequenceItem<Alignment>(
        //   tween: Tween<Alignment>(
        //       begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        //   weight: 1,
        // ),
        // TweenSequenceItem<Alignment>(
        //   tween: Tween<Alignment>(
        //       begin: Alignment.bottomLeft, end: Alignment.topLeft),
        //   weight: 1,
        // ),
      ],
    ).animate(_curve); //TweenSequence

    _gradientEnd = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      // TweenSequenceItem<Alignment>(
      //   tween:
      //       Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
      //   weight: 1,
      // ),
      // TweenSequenceItem<Alignment>(
      //   tween: Tween<Alignment>(
      //       begin: Alignment.topRight, end: Alignment.bottomRight),
      //   weight: 1,
      // ),
    ]).animate(_curve); //TweenSequence

    //animation for arrow on right side of container
    _rightArrowAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (e) {
              _controller.forward();
            },
            onExit: (e) {
              _controller.reverse();
            },
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: widget.onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    top: 11,
                    bottom: 11,
                    right: isMobile ? 25.w : 8.w,
                    left: isMobile ? 25.w : 8.w),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      AppColors.primaryColor,
                      AppColors.primaryColor2
                    ], begin: _gradientBegin.value, end: _gradientEnd.value),
                    // border: _borderAnimation.value,
                    // color: _colorAnimation.value,
                    borderRadius: AppDeco.appBorderRadius),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Text(
                        widget.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1),
                      ),
                    ),
                    widget.showIcon == true ? Gap(2.w) : const SizedBox(),
                    widget.showIcon == true
                        ? Transform.rotate(
                            //multiplying by 10 to increase the effect
                            angle: _rightArrowAnimation.value * -1,
                            // offset: Offset(_rightArrowAnimation.value * 10, 0),
                            child: Icon(
                              widget.icon,
                              color: AppColors.txtColor,
                              size: 14.r,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
