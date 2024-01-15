import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyper_effects/hyper_effects.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  List<String> translations = [
    'Hello',
    'Bonjour',
    'Marhaba',
    'Salaam',
    'Hola',
    'Ciao',
    'Hallo',
    'Hej',
    'Ahoj',
    'Saluton',
    'Konnichiwa',
    'Annyeong',
    'Ni Hao',
    'Namaste',
  ];
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
        translation = (translation + 1) % translations.length;
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
        ShaderMask(
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
              translations[lastTranslation],
              style: Theme.of(context).textTheme.displayMedium,
              // style: GoogleFonts.sacramento().copyWith(
              //   color: Colors.white,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 56,
              // ),
            )
                .roll(
                  translations[translation],
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
