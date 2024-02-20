import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:portfolio_daudk/config/constants/constants.dart';

import '../../config/themes/themes.dart';

class Translation extends StatefulWidget {
  // bool isMobile;
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  int lastTranslation = 0;
  int translation = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
        Duration(milliseconds: (2000 * timeDilation).toInt()), (timer) {
      setState(() {
        lastTranslation = translation;
        translation = (translation + 1) % Constants.translations.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isMobile
            ? Row(
                children: [
                  Text(
                    'Hello',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              )
            : ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0),
                    // Colors.white,
                  ],
                ).createShader(rect),
                child: ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      Colors.pinkAccent
                      // Colors.white,
                    ],
                  ).createShader(rect),
                  child: Text(
                    Constants.translations[lastTranslation],
                    style: Theme.of(context).textTheme.displayMedium,
                    // style: GoogleFonts.sacramento().copyWith(
                    //   color: Colors.white,
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 56,
                    // ),
                  )
                      .roll(
                        Constants.translations[translation],
                        symbolDistanceMultiplier: 2,
                        tapeCurve: Curves.easeInOutBack,
                        widthCurve: Curves.easeInOutQuart,
                        padding: const EdgeInsets.only(right: 3),
                      )
                      .animate(
                        trigger: translation,
                        duration: const Duration(milliseconds: 1000),
                      ),
                ),
              ),
        Text(
          ', Stranger',
          style: Theme.of(context).textTheme.displayMedium,
          strutStyle: StrutStyle(
            // fontSize: 56,
            //TODO fix height
            height: isMobile ? 2 : 5,
            forceStrutHeight: true,
            leading: 1,
          ),
        ),
      ],
    );
  }
}
