import 'dart:ui';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/data/models/work_model.dart';
import 'package:portfolio_daudk/ui/widgets/custom_image.dart';
import 'package:portfolio_daudk/ui/widgets/underline_title_widget.dart';

import '../../config/themes/themes.dart';
import 'pill_container.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    super.key,
    required this.singleItem,
    required this.isMobile,
    required InfiniteScrollController scrollControllerForward,
  }) : _scrollControllerForward = scrollControllerForward;

  final WorkModel singleItem;
  final bool isMobile;
  final InfiniteScrollController _scrollControllerForward;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        // padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
        decoration: const BoxDecoration(
          color: AppColors.cardGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: singleItem.title,
                          ),
                          Gap(12.h),
                          Text(singleItem.description),
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
                              tooltip: 'Store Link',
                              onPressed: () async {
                                launchNewTabClient(singleItem.link!);
                              },
                              icon: const Icon(CupertinoIcons.link)),
                      singleItem.isAndroid
                          ? IconButton.outlined(
                              tooltip: 'Android Application',
                              mouseCursor: SystemMouseCursors.basic,
                              onPressed: () {},
                              icon: const Icon(Icons.android))
                          : const SizedBox.shrink(),
                      singleItem.isIos
                          ? IconButton.outlined(
                              tooltip: 'IOS Application',
                              onPressed: () {},
                              mouseCursor: SystemMouseCursors.basic,
                              icon: const Icon(Icons.apple))
                          : const SizedBox.shrink()
                    ],
                  )),
                ],
              ),
            ),
            singleItem.tags.isEmpty
                ? const SizedBox.shrink()
                : ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        // Allows to swipe in web browsers
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse
                      },
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeLeftRight,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                            left: LayoutValues.cardsInnerSpace,
                            bottom: LayoutValues.cardsInnerSpace),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                singleItem.tags.length,
                                (index) => PillContainer(
                                    text: singleItem.tags[index]))),
                      ),
                    ),
                  ),
            singleItem.imgs.isEmpty
                ? const SizedBox()
                : Container(
                    width: double.infinity,
                    height: 300.h,
                    padding:
                        EdgeInsets.only(bottom: LayoutValues.cardsInnerSpace),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        InfiniteCarousel.builder(
                          itemCount: singleItem.imgs.length,
                          itemExtent: isMobile ? 190.w : 40.w,
                          controller: _scrollControllerForward,
                          center: false,
                          anchor: 0.0,
                          velocityFactor: 0.2,
                          onIndexChanged: (carouselIndex) {},
                          axisDirection: Axis.horizontal,
                          loop: true,
                          scrollBehavior:
                              ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              // Allows to swipe in web browsers
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse
                            },
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, itemIndex, realIndex) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: LayoutValues.cardsInnerSpace),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    AppColors.bgGrey,
                                    AppColors.bgGrey,
                                  ]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  final imageProvider =
                                      Image.network(singleItem.imgs[itemIndex])
                                          .image;

                                  showImageViewer(context, imageProvider,
                                      immersive: true,
                                      swipeDismissible: true,
                                      backgroundColor:
                                          AppColors.bgGrey.withOpacity(0.8),
                                      onViewerDismissed: () {});

                                  // MultiImageProvider
                                  //     multiImageProvider =
                                  //     MultiImageProvider(List.generate(
                                  //         workList[index].imgs.length,
                                  //         (listIndex) => NetworkImage(
                                  //             workList[index]
                                  //                 .imgs[listIndex])));

                                  // showImageViewerPager(
                                  //     context, multiImageProvider,

                                  //     swipeDismissible: true,
                                  //     backgroundColor: AppColors
                                  //         .bgGrey
                                  //         .withOpacity(0.8),
                                  //     immersive: true);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CustomImage(
                                      fit: BoxFit.cover,
                                      imageUrl: singleItem.imgs[itemIndex]),
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
  }
}
