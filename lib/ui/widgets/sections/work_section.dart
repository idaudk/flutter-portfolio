import 'dart:async';
import 'dart:ui';
import 'dart:ui_web';
import 'dart:js' as js;

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/ui/widgets/cta_box.dart';
import 'package:portfolio_daudk/ui/widgets/custom_image.dart';
import 'package:portfolio_daudk/ui/widgets/underline_title_widget.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:url_launcher/url_launcher.dart';

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
  double offSet = 0;

  @override
  void initState() {
    _scrollControllerForward = InfiniteScrollController();
    // _scrollControllerReverse = InfiniteScrollController();

    // _scrollControllerForward.addListener(() {
    //   _scrollControllerForward.
    // });

    // Timer.periodic(const Duration(milliseconds: 3000), (timer) {
    //   offSet = offSet + 100;
    //   _scrollControllerForward.animateTo(offSet,
    //       duration: const Duration(milliseconds: 3000), curve: Curves.linear);
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
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

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
              var singleItem = workList[index];
              return Container(
                  clipBehavior: Clip.hardEdge,
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
                                singleItem.link == null
                                    ? const SizedBox.shrink()
                                    : IconButton.outlined(
                                        onPressed: () async {
                                          js.context.callMethod(
                                              'open', [singleItem.link]);
                                          // final Uri _url = Uri.parse('https://flutter.dev');
                                          // await launchUrl(_url,
                                          // mode: LaunchMode.
                                          // );
                                        },
                                        icon: const Icon(CupertinoIcons.link)),
                                singleItem.isAndroid
                                    ? IconButton.outlined(
                                        mouseCursor: SystemMouseCursors.basic,
                                        onPressed: () {},
                                        icon: const Icon(Icons.android))
                                    : const SizedBox.shrink(),
                                singleItem.isIos
                                    ? IconButton.outlined(
                                        onPressed: () {},
                                        mouseCursor: SystemMouseCursors.basic,
                                        icon: const Icon(Icons.apple))
                                    : const SizedBox.shrink()
                              ],
                            )),
                          ],
                        ),
                      ),
                      workList[index].imgs.isEmpty
                          ? const SizedBox()
                          : Container(
                              width: double.infinity,
                              height: 300.h,
                              padding: EdgeInsets.only(
                                  bottom: LayoutValues.cardsInnerSpace),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  InfiniteCarousel.builder(
                                    itemCount: workList[index].imgs.length,
                                    itemExtent: isMobile ? 190.w : 40.w,
                                    controller: _scrollControllerForward,
                                    center: false,
                                    anchor: 0.0,
                                    velocityFactor: 0.2,
                                    onIndexChanged: (index) {},
                                    axisDirection: Axis.horizontal,
                                    loop: true,
                                    scrollBehavior:
                                        ScrollConfiguration.of(context)
                                            .copyWith(
                                      dragDevices: {
                                        // Allows to swipe in web browsers
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind.mouse
                                      },
                                    ),
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (context, itemIndex, realIndex) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: LayoutValues.cardsInnerSpace),
                                        decoration: BoxDecoration(
                                            gradient:
                                                const LinearGradient(colors: [
                                              AppColors.bgGrey,
                                              AppColors.bgGrey,
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onTap: () {
                                            final imageProvider = Image.network(
                                                    workList[index]
                                                        .imgs[itemIndex])
                                                .image;
                                            showImageViewer(
                                                backgroundColor: AppColors
                                                    .bgGrey
                                                    .withOpacity(0.8),
                                                swipeDismissible: true,
                                                context,
                                                imageProvider,
                                                onViewerDismissed: () {
                                              // print("dismissed");
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CustomImage(
                                                fit: BoxFit.cover,
                                                imageUrl: workList[index]
                                                    .imgs[itemIndex]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // Positioned(
                                  //   right: LayoutValues.cardsInnerSpace,
                                  //   child: IconButton.outlined(
                                  //       onPressed: () {},
                                  //       icon: Icon(CupertinoIcons.arrow_right)),
                                  // )
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
