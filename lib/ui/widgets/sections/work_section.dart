import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/ui/widgets/cta_box.dart';
import 'package:portfolio_daudk/ui/widgets/underline_title_widget.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../../../config/themes/themes.dart';
import '../../../data/models/work_model.dart';

class WorkSection extends StatefulWidget {
  bool isMobile;
  WorkSection({this.isMobile = false, super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  late InfiniteScrollController _scrollControllerForward;
  // late InfiniteScrollController _scrollControllerReverse;

  @override
  void initState() {
    _scrollControllerForward = InfiniteScrollController();
    // _scrollControllerReverse = InfiniteScrollController();

    // Timer.periodic(const Duration(seconds: 2), (timer) {
    //   print('slide next');
    //  _scrollControllerForward.animateTo(200, duration: Duration(milliseconds: 1500), curve: Curves.fastOutSlowIn);
    //   // _scrollControllerReverse.previousItem(
    //   //     duration: Duration(seconds: 2), curve: Curves.easeInQuart);
    // });

    super.initState();
  }

  @override
  void dispose() {
    _scrollControllerForward.dispose();
    // _scrollControllerReverse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
          'My Work',
          style: Theme.of(context).textTheme.displayMedium,
        )),
        Gap(LayoutValues.widgetYspace),
        StaggeredGrid.count(
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          crossAxisCount: widget.isMobile ? 1 : 2,
          children: List.generate(workList.length + 1, (index) {
            if (index < workList.length) {
              return Container(
                  // padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
                  decoration: const BoxDecoration(
                    color: AppColors.cardGrey,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
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
                                    Gap(12.h),
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.android)),
                                IconButton.outlined(
                                    onPressed: () {},
                                    icon: const Icon(Icons.apple))
                              ],
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        padding: EdgeInsets.only(
                            bottom: LayoutValues.cardsInnerSpace),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            InfiniteCarousel.builder(
                              itemCount: 6,
                              itemExtent: 100.w,
                              controller: _scrollControllerForward,
                              center: false,
                              anchor: 0.0,
                              velocityFactor: 0.2,
                              onIndexChanged: (index) {},
                              axisDirection: Axis.horizontal,
                              // loop: true,
                              scrollBehavior:
                                  ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  // Allows to swipe in web browsers
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.mouse
                                },
                              ),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, itemIndex, realIndex) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: LayoutValues.cardsInnerSpace),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppColors.bgGrey,
                                        AppColors.bgGrey,
                                      ]),
                                      borderRadius: AppDeco.appBorderRadius),
                                  child:
                                      Center(child: Text('image ${itemIndex}')),
                                );
                              },
                            ),
                            Positioned(
                              right: LayoutValues.cardsInnerSpace,
                              child: IconButton.outlined(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.arrow_right)),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            } else {
              return const CtaBox();
            }
          }),
        ),
      ],
    );
  }
}
