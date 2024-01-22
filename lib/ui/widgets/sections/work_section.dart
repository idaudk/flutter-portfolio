import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:portfolio_daudk/ui/widgets/cta_box.dart';
import 'package:portfolio_daudk/ui/widgets/work_card.dart';

import '../../../config/themes/themes.dart';
import '../../../data/models/work_model.dart';

class WorkSection extends StatefulWidget {
  final bool isMobile;
  const WorkSection({this.isMobile = false, super.key});

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
              return WorkCard(
                  singleItem: singleItem,
                  isMobile: isMobile,
                  scrollControllerForward: _scrollControllerForward);
            } else {
              return const CtaBox();
            }
          }),
        ),
      ],
    );
  }
}
