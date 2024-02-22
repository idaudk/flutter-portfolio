import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/resources/resources.dart';
import '../../config/themes/themes.dart';

const List<String> slider2Assets = [
  SvgAssets.map_ui,
  SvgAssets.login_ui,
  SvgAssets.setting_1_ui
];
const List<String> slider1Assets = [
  SvgAssets.setting_1_ui,
  SvgAssets.setting_2_ui,
  SvgAssets.setting_3_ui
];

class FirstSlider extends StatelessWidget {
  const FirstSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        disableGesture: true,
        itemCount: slider1Assets.length,
        itemBuilder: (_, index, index2) => Padding(
              padding: EdgeInsets.only(bottom: LayoutValues.cardsInnerSpace),
              child: SvgPicture.asset(slider1Assets[index]),
            ),
        options: CarouselOptions(
            pauseAutoPlayOnTouch: false,
            pauseAutoPlayOnManualNavigate: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.vertical,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            reverse: false,
            viewportFraction: 0.7,
            pageSnapping: false,
            aspectRatio: 16.5 / 9,
            // minus 100 beacuse header height is 100

            height: ScreenUtil().screenHeight - 100,
            autoPlayInterval: const Duration(seconds: 5)));
  }
}

class SecondSlider extends StatelessWidget {
  const SecondSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        disableGesture: true,
        itemCount: slider2Assets.length,
        itemBuilder: (_, index, index2) => Padding(
              padding: EdgeInsets.only(bottom: LayoutValues.cardsInnerSpace),
              child: SvgPicture.asset(slider2Assets[index]),
            ),
        options: CarouselOptions(
            pauseAutoPlayOnTouch: false,
            pauseAutoPlayOnManualNavigate: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.vertical,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            reverse: true,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.fastOutSlowIn,
            pageSnapping: false,
            aspectRatio: 16.5 / 9,
            // minus 100 beacuse header height is 100
            height: ScreenUtil().screenHeight - 100,
            autoPlayInterval: const Duration(seconds: 5)));
  }
}
